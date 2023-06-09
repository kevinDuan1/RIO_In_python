import os 
import sys
current_directory = os.path.dirname(os.path.abspath(__file__))
sys.path.append(current_directory)
import numpy as np
from utils.data_types import *
from utils.ros_helper import *
from scipy.spatial.transform import Rotation as R
from scipy.stats import chi2
from ekf_config import *

class EkfRioFilter:
    def __init__(self, imu_init_vec, baro_h0):
        self.config_ = Ekf_Rio_config()
        
        self.kStreamingPrefix = "[EkfRioFilter]: "
        self.error_idx_ = EkfRioFilterStateIdx() 
        self.x_error_ = np.zeros(self.error_idx_.base_state_length) 
        self.init_struct_ = InitStruct()
        self.init_struct_.configure(self.error_idx_, self.config_)
        
        self.nav_sol_ = NavigationSolution()
        self.nav_sol_.set_position_n_b(self.init_struct_.p_0)
        self.nav_sol_.v_n_b = self.init_struct_.v_0
        
        # init attitude from acc
        a_accu = np.zeros(3); w_accu = np.zeros(3)
        for imu_data in imu_init_vec:
            a_accu += imu_data.a_b_ib
            w_accu += imu_data.w_b_ib
        acc_mean = a_accu / len(imu_init_vec)
        w_mean = w_accu / len(imu_init_vec)

        roll_pitch = initFromAcc(acc_mean, self.init_struct_.gravity)
        # print('roll_pitch : ', np.rad2deg(roll_pitch))
        self.nav_sol_.set_euler_n_b(np.array([roll_pitch[0], roll_pitch[1], self.init_struct_.yaw_0]))
        
        #init bias
        self.bias_ = Offsets()
        self.bias_.acc = self.init_struct_.b_a_0
        self.bias_.gyro = w_mean + self.init_struct_.b_w_0 if self.init_struct_.omega_calibration else self.init_struct_.b_w_0
        self.bias_.alt = baro_h0

        # print('w_mean : ', w_mean, 'bw0', self.init_struct_.b_w_0)
        # init T_b_r
        self.T_b_r_ = np.identity(4)
        self.T_b_r_[:3, 3] = self.init_struct_.l_b_r_0
        self.T_b_r_[:3, :3] = R.from_quat(self.init_struct_.q_b_r_0).as_matrix() 
        # print('T_b_r', self.T_b_r_)
        self.covariance_ = self.init_struct_.P_kk_0


        self.strapdown_ = Strapdown(self.init_struct_.gravity)
        self.system_noise_ = SystemNoisePsd()   
        self.system_noise_.configure(self.config_)
        self.time_stamp_ = imu_init_vec[-1].time_stamp   
        self.radar_clone_state_ = RadarCloneState()  

    def propagate(self, imu):
        self.time_stamp_ = imu.time_stamp

        a_b_ib_corrected = imu.a_b_ib - self.bias_.acc
        w_b_ib_corrected = imu.w_b_ib - self.bias_.gyro
        self.nav_sol_ = self.strapdown_.propagate(self.nav_sol_, a_b_ib_corrected, w_b_ib_corrected, imu.dt)

        Phi = self.getPhi(a_b_ib_corrected, imu.dt)
        G = self.system_noise_.getG(self.nav_sol_.get_c_n_b(), self.error_idx_, self.covariance_.shape[0])

        # TODO: consider more efficient implementation!!
        self.covariance_ = Phi @ self.covariance_ @ Phi.T + G @ self.system_noise_.getQ(imu.dt) @ G.T

        return True

    def getPhi(self, a_b_ib, T):
        F = np.zeros((self.error_idx_.prob_noise_state_length, self.error_idx_.prob_noise_state_length))
        F[self.error_idx_.position:self.error_idx_.position+3, self.error_idx_.velocity:self.error_idx_.velocity+3]  = np.eye(3)
        F[self.error_idx_.velocity:self.error_idx_.velocity+3, self.error_idx_.attitude:self.error_idx_.attitude+3]  = -1 * skewVec(self.nav_sol_.get_c_n_b().dot(a_b_ib))
        F[self.error_idx_.velocity:self.error_idx_.velocity+3, self.error_idx_.bias_acc:self.error_idx_.bias_acc+3]  = -self.nav_sol_.get_c_n_b()
        F[self.error_idx_.attitude:self.error_idx_.attitude+3, self.error_idx_.bias_gyro:self.error_idx_.bias_gyro+3] = -self.nav_sol_.get_c_n_b()

        Phi = np.eye(self.covariance_.shape[0], self.covariance_.shape[1])
        Phi[0:F.shape[0], 0:F.shape[1]] += F * T

        return Phi
    
    def kfUpdate(self, r, H, R_diag):
        # if r.shape[0] > 1:
        #     print('r', r)
            # print('H', H)
            # print('R_diag', R_diag)
            # print(f'cov {np.linalg.norm(self.covariance_)}')
        R = np.diag(R_diag)
        S = H @ self.covariance_ @ H.T + R
        S_inv = np.linalg.pinv(S)
        K = self.covariance_ @ H.T @ S_inv
        x_error = K @ r
        self.covariance_ = self.covariance_ - K @ H @ self.covariance_
        self.correctNominalState(x_error)
        return True 
    
    def correctNominalState(self, x_error):
        self.nav_sol_.set_position_n_b(self.nav_sol_.get_position_n_b() - x_error[self.error_idx_.position:self.error_idx_.position+3])
        # print(f'v_change{x_error[self.error_idx_.velocity:self.error_idx_.velocity+3]}')
        # print(f'v before {self.nav_sol_.v_n_b}')
        self.nav_sol_.v_n_b -= x_error[self.error_idx_.velocity:self.error_idx_.velocity+3]
        self.nav_sol_.set_quaternion(self.getCorrectedQuaternion(x_error[self.error_idx_.attitude:self.error_idx_.attitude+3], self.nav_sol_.get_quaternion_n_b()))
        # print(f'v after {self.nav_sol_.v_n_b}')
        # print('')
        self.bias_.acc -= x_error[self.error_idx_.bias_acc:self.error_idx_.bias_acc+3]
        self.bias_.gyro -= x_error[self.error_idx_.bias_gyro:self.error_idx_.bias_gyro+3]
        self.bias_.alt -= x_error[self.error_idx_.bias_alt]
        self.T_b_r_[:3,3] -= x_error[self.error_idx_.l_b_r:self.error_idx_.l_b_r+3]
        self.T_b_r_[:3,:3] = R.from_quat(self.getCorrectedQuaternion(x_error[self.error_idx_.eul_b_r:self.error_idx_.eul_b_r+3], R.from_matrix(self.T_b_r_[:3, :3]).as_quat())).as_matrix()
        
        if self.covariance_.shape[0] > self.error_idx_.base_state_length:
            self.radar_clone_state_.nav_sol.set_position_n_b(self.radar_clone_state_.nav_sol.get_position_n_b() - x_error[self.error_idx_.sc_position:self.error_idx_.sc_position+3])
            self.radar_clone_state_.nav_sol.v_n_b -= x_error[self.error_idx_.sc_velocity:self.error_idx_.sc_velocity+3]

            self.radar_clone_state_.nav_sol.set_quaternion(self.getCorrectedQuaternion(x_error[self.error_idx_.sc_attitude:self.error_idx_.sc_attitude+3], self.radar_clone_state_.nav_sol.get_quaternion_n_b()))
            self.radar_clone_state_.T_b_r[:3,3] -= x_error[self.error_idx_.sc_l_b_r:self.error_idx_.sc_l_b_r+3]
            self.radar_clone_state_.T_b_r[:3,:3] = R.from_quat(self.getCorrectedQuaternion(x_error[self.error_idx_.sc_eul_b_r:self.error_idx_.sc_eul_b_r+3], R.from_matrix(self.radar_clone_state_.T_b_r[:3,:3]).as_quat())).as_matrix()
        
        return True

    def addRadarStateClone(self, trigger_stamp):
        if self.covariance_.shape[0] > self.error_idx_.base_state_length:
            self.removeRadarStateClone()

        J_ = np.zeros((18, self.error_idx_.base_state_length))
        J_[0:9, 0:9] = np.eye(9)
        J_[9:12, self.error_idx_.bias_gyro:self.error_idx_.bias_gyro+3] = np.eye(3)
        J_[12:18, self.error_idx_.l_b_r:self.error_idx_.l_b_r+6] = np.eye(6)

        J = np.zeros((self.error_idx_.base_state_length + self.error_idx_.radar_clone_length, self.error_idx_.base_state_length))
        J[0:self.error_idx_.base_state_length, 0:self.error_idx_.base_state_length] = np.eye(self.error_idx_.base_state_length)
        J[self.error_idx_.base_state_length:, 0:J_.shape[1]] = J_

        self.covariance_ = J @ self.covariance_ @ J.T
        self.radar_clone_state_.time_stamp = self.time_stamp_
        self.radar_clone_state_.trigger_time_stamp = trigger_stamp
        self.radar_clone_state_.nav_sol = self.nav_sol_
        self.radar_clone_state_.offset_gyro = self.bias_.gyro
        self.radar_clone_state_.T_b_r[:3,  :3] = self.T_b_r_[:3,  :3]
        self.radar_clone_state_.T_b_r[:3,  3] = self.T_b_r_[:3,  3]
        return True  

    def removeRadarStateClone(self):
        if self.covariance_.shape[0] > self.error_idx_.base_state_length:
            if self.covariance_.shape[0] > self.error_idx_.base_state_length + self.error_idx_.radar_clone_length:
                print('Dims of covariance larger than one clone, THIS SHOULD NOT HAPPEN!"')

            self.radar_clone_state_.time_stamp = rospy.Time(0)
            self.radar_clone_state_.trigger_time_stamp = rospy.Time(0)
            self.radar_clone_state_.T_b_r = np.identity(4)
            self.radar_clone_state_.offset_gyro = [-1, -1, -1]
            self.radar_clone_state_.nav_sol = None

            # workaround: first row gets randomly zeros if no tmp used
            covariance_tmp = self.covariance_.copy()
            self.covariance_ = covariance_tmp[0:self.error_idx_.base_state_length, 0:self.error_idx_.base_state_length]
            return True
        return False

    def updateAltimeter(self, neg_rel_h, sigma):
        H = np.zeros((1, self.getCovarianceMatrix().shape[1]))
        r = np.zeros(1)
        R_diag = np.zeros(1)

        H[0, self.getErrorIdx().position + 2] = 1
        H[0, self.getErrorIdx().bias_alt] = 1
        h_filter = self.getNavigationSolution().get_position_n_b()[2]
        h_meas = neg_rel_h - self.getBias().alt
        r[0] = h_filter - h_meas
        R_diag[0] = sigma ** 2
        self.kfUpdate(r, H, R_diag)
        return True   


    def updateRadarEgoVelocity(self, v_r, sigma_v_r, w, outlier_rejection_thresh):
        H = np.zeros((3, self.getCovarianceMatrix().shape[1]))
        r = np.zeros(3)
        R_diag = np.zeros(3)

        C_n_b = self.getRadarCloneState().nav_sol.get_c_n_b()
        C_b_r = self.getRadarCloneState().T_b_r[:3,:3]
        l_b_br = self.getRadarCloneState().T_b_r[:3,3]

        # print('Cnb', C_n_b)
        # print('C_b_r', C_b_r)
        # print('lbbr', l_b_br)

        v_w = skewVec(w - self.getRadarCloneState().offset_gyro) @ l_b_br
        v_n_b = self.getRadarCloneState().nav_sol.v_n_b
        v_b = C_n_b.T @ v_n_b
        
    
        # print('----------')
        # print(v_w)
        # print(v_n_b)     
        # print(self.nav_sol_.v_n_b)
        # print(v_b)
        # print('++++++++++')

        H_v = C_b_r.T @ C_n_b.T
        H_q = C_b_r.T @ C_n_b.T @ skewVec(v_n_b)
        H_bg = -C_b_r.T @ skewVec(l_b_br)
        H_l_b_r = C_b_r.T @ skewVec(w)
        H_q_b_r = C_b_r.T @ skewVec(v_w + v_b)
        
        # print(f'H_v{H_v}')
        # print(f'H_q{H_q}')
        # print(f'H_bg{H_bg}')
        # print(f'Hlbr{H_l_b_r}')
        # print(f'H_q_b_r{H_q_b_r}')

        H[0:3, self.getErrorIdx().sc_velocity: self.getErrorIdx().sc_velocity + 3] = H_v
        H[0:3, self.getErrorIdx().sc_attitude: self.getErrorIdx().sc_attitude + 3] = H_q
        H[0:3, self.getErrorIdx().sc_bias_gyro: self.getErrorIdx().sc_bias_gyro + 3] = H_bg
        H[0:3, self.getErrorIdx().sc_l_b_r: self.getErrorIdx().sc_l_b_r + 3] = H_l_b_r
        H[0:3, self.getErrorIdx().sc_eul_b_r: self.getErrorIdx().sc_eul_b_r + 3] = H_q_b_r
        
        v_r_filter = C_b_r.T @ (v_w + v_b)
        r = v_r_filter - v_r
        R_diag = sigma_v_r ** 2

        # print(f'v_r_filter {v_r_filter}')
        # print(f'r : {r}')
        # print(f'R_diag : {R_diag}')
        
        # outlier rejection
        if outlier_rejection_thresh > 0.001:
            gamma = r.T @ np.linalg.inv(H @ self.covariance_ @ H.T + np.diag(R_diag)) @ r
            chi_squared_dist = chi2(df=3.0)
            gamma_thresh = chi_squared_dist.ppf(1 - outlier_rejection_thresh)

            if gamma < gamma_thresh:
                self.kfUpdate(r, H, R_diag)
            else:
                rospy.loginfo("Outlier radar")
                return False
        else:
            self.kfUpdate(r, H, R_diag)
        return True 

    def getTimestamp(self):
        return self.time_stamp_

    def getCovarianceMatrix(self):
        return self.covariance_

    def getErrorIdx(self):
        return self.error_idx_

    def getNavigationSolution(self):
        return self.nav_sol_

    def getBias(self):
        return self.bias_

    def getlbr(self):
        return self.T_b_r_[:3,  3]  # implement as per your needs

    def getCbr(self):
        return self.T_b_r_[:3,  :3]  # implement as per your needs

    def getTbr(self):
        return self.T_b_r_

    def getRadarCloneState(self):
        return self.radar_clone_state_

    def getCorrectedQuaternion(self, err_euler, q):
        p = R.from_quat(np.array([-0.5*err_euler[0], -0.5*err_euler[1], -0.5*err_euler[2], 1])).as_quat()
        return quaternionMultiplicationHamilton(p, q)   
