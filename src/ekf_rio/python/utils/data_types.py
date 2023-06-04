from scipy.spatial.transform import Rotation as R
import numpy as np
import math
from math import pow
from sensor_msgs.msg import Imu

class EkfRioFilterStateIdx:
    def __init__(self):
        self.position = 0
        self.velocity = 3
        self.attitude = 6
        self.bias_acc = 9
        self.bias_gyro = 12
        self.bias_alt = 15
        self.l_b_r = 16
        self.eul_b_r = 19
        self.base_state_length = 22
        self.prob_noise_state_length = 15
        self.sc_position = 22 + 0
        self.sc_velocity = 22 + 3
        self.sc_attitude = 22 + 6
        self.sc_bias_gyro = 22 + 9
        self.sc_l_b_r = 22 + 12
        self.sc_eul_b_r = 22 + 15
        self.radar_clone_length = 18


class NavigationSolution:

    def __init__(self, pose_n_b=None, v_n_b=None, p_n_b=None, q_n_b=None):
        
        if pose_n_b is None and v_n_b is None:
            self.pose_n_b = np.identity(4)
            self.v_n_b = np.zeros(3)

        elif p_n_b is None and q_n_b is None:
            self.pose_n_b = pose_n_b
            self.v_n_b = v_n_b

        else:
            self.pose_n_b = np.identity(4)
            self.v_n_b = v_n_b
            self.set_quaternion(q_n_b)
            self.set_position_n_b(p_n_b)

    def get_position_n_b(self):
        return self.pose_n_b[:3, 3]

    def set_position_n_b(self, p_n_b):
        self.pose_n_b[:3, 3] = p_n_b

    def get_quaternion_n_b(self):
        return R.from_matrix(self.pose_n_b[:3, :3]).as_quat()

    def set_quaternion(self, q_n_b):
        self.pose_n_b[:3, :3] = R.from_quat(q_n_b).as_matrix()

    def get_euler_n_b(self):
        return R.from_matrix(self.pose_n_b[:3, :3]).as_euler('xyz', degrees=False)

    def set_euler_n_b(self, eul_n_b):
        self.pose_n_b[:3, :3] = R.from_euler('xyz', eul_n_b, degrees=False).as_matrix()
    
    def get_c_n_b(self):
        return self.pose_n_b[:3, :3]

    def get_pose(self):
        return self.pose_n_b

    def get_pose_ros(self):
        q_n_b = np.eye(4)
        q_n_b[:3, :3] = R.from_euler('xyz', [math.pi, 0, 0], degrees=False).as_matrix()
        return q_n_b @ self.pose_n_b

    def get_velocity_ros(self):
        return np.array([self.v_n_b[0], -self.v_n_b[1], -self.v_n_b[2]])


class InitStruct:
    def __init__(self):
        self.p_0 = np.array([0, 0, 0])
        self.v_0 = np.array([0, 0, 0])
        self.yaw_0 = 0.0
        self.b_a_0 = np.array([0, 0, 0])
        self.b_w_0 = np.array([0, 0, 0])
        self.b_alt_0 = 0.0
        self.l_b_r_0 = np.array([0, 0, 0])
        self.q_b_r_0 = R.from_quat([0, 0, 0, 1]).as_quat()
        self.P_kk_0 = None
        self.gravity = 0
        self.omega_calibration = True

    def configure(self, error, config):
        self.p_0 = np.array([config.p_0_x, config.p_0_y, config.p_0_z])
        self.v_0 = np.array([config.v_0_x, config.v_0_y, config.v_0_z])
        self.yaw_0 = np.deg2rad(config.yaw_0_deg)
        self.b_a_0 = np.array([config.b_0_a_x, config.b_0_a_y, config.b_0_a_z])
        self.b_w_0 = np.deg2rad(np.array([config.b_0_w_x_deg, config.b_0_w_y_deg, config.b_0_w_z_deg]))
        self.b_alt_0 = config.b_0_alt
        self.l_b_r_0 = np.array([config.l_b_r_x, config.l_b_r_y, config.l_b_r_z])
        self.P_kk_0 = np.eye(error.base_state_length)

        np.fill_diagonal(self.P_kk_0[error.position:error.position+3, error.position:error.position+3], np.array([1, 1, 1]) * np.power(config.sigma_p, 2))

        np.fill_diagonal(self.P_kk_0[error.velocity:error.velocity+3, error.velocity:error.velocity+3], np.array([1, 1, 1]) * np.power(config.sigma_v, 2))

        np.fill_diagonal(self.P_kk_0[error.attitude:error.attitude+3, error.attitude:error.attitude+3], np.array([np.deg2rad(config.sigma_roll_pitch_deg), np.deg2rad(config.sigma_roll_pitch_deg), np.deg2rad(config.sigma_yaw_deg)]) ** 2)

        np.fill_diagonal(self.P_kk_0[error.bias_acc:error.bias_acc+3, error.bias_acc:error.bias_acc+3], np.array([1, 1, 1]) * np.power(config.sigma_b_a, 2))

        np.fill_diagonal(self.P_kk_0[error.bias_gyro:error.bias_gyro+3, error.bias_gyro:error.bias_gyro+3], np.array([1, 1, 1]) * np.power(np.deg2rad(config.sigma_b_w_deg), 2))

        self.P_kk_0[error.bias_alt, error.bias_alt] = np.power(config.sigma_b_alt, 2)

        np.fill_diagonal(self.P_kk_0[error.l_b_r:error.l_b_r+3, error.l_b_r:error.l_b_r+3], np.array([config.sigma_l_b_r_x, config.sigma_l_b_r_y, config.sigma_l_b_r_z]) ** 2)

        np.fill_diagonal(self.P_kk_0[error.eul_b_r:error.eul_b_r+3, error.eul_b_r:error.eul_b_r+3], np.array([np.deg2rad(config.sigma_eul_b_r_roll_deg), np.deg2rad(config.sigma_eul_b_r_pitch_deg), np.deg2rad(config.sigma_eul_b_r_yaw_deg)]) ** 2)

        self.gravity = config.g_n
        self.omega_calibration = config.calib_gyro

        return True


#offset
class Offsets:
    def __init__(self):
        self.acc = np.array([-1, -1, -1])
        self.gyro = np.array([-1, -1, -1])
        self.alt = -1


#Radar clone state:
class RadarCloneState:
    def __init__(self, time_stamp=None, trigger_time_stamp=None, nav_sol=None, offset_gyro=None):
        self.time_stamp = time_stamp
        self.trigger_time_stamp = trigger_time_stamp
        self.nav_sol = nav_sol
        self.offset_gyro = [-1, -1, -1]
        self.T_b_r = np.identity(4)


#noise 


class SystemNoisePsd:

    def __init__(self):
        self.acc = -1
        self.gyro = -1
        self.bias_acc = -1
        self.bias_gyro = -1
        self.bias_alt = -1

    def configure(self, config):
        self.acc = config.noise_psd_a
        self.gyro = np.radians(config.noise_psd_w_deg)
        self.bias_acc = config.noise_psd_b_a
        self.bias_gyro = np.radians(config.noise_psd_b_w_deg)
        self.bias_alt = config.noise_psd_b_alt
        return True

    def getQ(self, T):
        Q = np.zeros((13, 13))
        Q[0:3, 0:3] = np.eye(3) * pow(self.acc, 2) * T
        Q[3:6, 3:6] = np.eye(3) * pow(self.gyro, 2) * T
        Q[6:9, 6:9] = np.eye(3) * pow(self.bias_acc, 2) / T
        Q[9:12, 9:12] = np.eye(3) * pow(self.bias_gyro, 2) / T
        Q[12, 12] = pow(self.bias_alt, 2) / T
        return Q

    def getG(self, C_n_b, stateIdx, error_state_length):
        G = np.zeros((error_state_length, 13))
        G[stateIdx.velocity:stateIdx.velocity+3, 0:3] = C_n_b
        G[stateIdx.attitude:stateIdx.attitude+3, 3:6] = C_n_b
        G[stateIdx.bias_acc:stateIdx.bias_acc+3, 6:9] = np.eye(3)
        G[stateIdx.bias_gyro:stateIdx.bias_gyro+3, 9:12] = np.eye(3)
        G[stateIdx.bias_alt, 12] = 1
        return G


# Strapdown

class Strapdown:

    def __init__(self, local_gravity):
        self.local_gravity_ = np.array([0, 0, local_gravity])
    
    def propagate(self, nav_sol_prev, a_b_ib, w_b_ib, dt):
        C_n_b_prev = nav_sol_prev.get_c_n_b()
        v_n_b_prev = nav_sol_prev.v_n_b
        
        # propagate attitude with forth order runge kutta
        zero_omega = np.concatenate([[0], w_b_ib])
        q_n_b_prev = nav_sol_prev.get_quaternion_n_b()
        q_n_b_vec = np.concatenate([[q_n_b_prev[3]], [q_n_b_prev[0]], [q_n_b_prev[1]], [q_n_b_prev[2]]])
        
        k_1 = 0.5 * self.getQLeftMatrix(q_n_b_vec).dot(zero_omega)
        k_2 = 0.5 * self.getQLeftMatrix(q_n_b_vec + k_1 * dt / 2).dot(zero_omega)
        k_3 = 0.5 * self.getQLeftMatrix(q_n_b_vec + k_2 * dt / 2).dot(zero_omega)
        k_4 = 0.5 * self.getQLeftMatrix(q_n_b_vec + k_3 * dt).dot(zero_omega)
        
        new_q_vec = q_n_b_vec + (k_1 + 2 * k_2 + 2 * k_3 + k_4) * dt / 6
        q_n_b = R.from_quat(np.array([new_q_vec[1], new_q_vec[2], new_q_vec[3], new_q_vec[0]])).as_quat()
        # propagate velocity using Simpson's rule
        q_b1_b = R.from_quat(q_n_b_prev).as_matrix() @ np.linalg.inv(R.from_quat(q_n_b).as_matrix())
        C_b1_b = q_b1_b
        
        s_l = (a_b_ib + 4 * (a_b_ib + 0.5 * (C_b1_b - np.eye(3)) @ a_b_ib) + (a_b_ib + (C_b1_b - np.eye(3)) @ a_b_ib)) * dt / 6
        
        v_n_b = v_n_b_prev + C_n_b_prev.dot(s_l) + self.local_gravity_ * dt
        
        # propagate position using chained Simpson's rule
        v_01 = (a_b_ib + 4 * (a_b_ib + 0.25 * (C_b1_b - np.eye(3)) @ a_b_ib) + (a_b_ib + 0.5 * (C_b1_b - np.eye(3)) @ a_b_ib)) * dt / 12
        y_l = (4 * v_01 + s_l) * dt / 6
        p_n1_n = v_n_b_prev * dt + C_n_b_prev.dot(y_l) + 0.5 * self.local_gravity_ * dt**2
        p_n_b = nav_sol_prev.get_position_n_b() + p_n1_n
        return NavigationSolution(p_n_b=p_n_b, q_n_b=q_n_b, v_n_b=v_n_b)
        
    def getQLeftMatrix(self, v):
        m = np.array([[ v[0], -v[1], -v[2], -v[3]],
                      [ v[1],  v[0], -v[3],  v[2]],
                      [ v[2],  v[3],  v[0], -v[1]],
                      [ v[3], -v[2],  v[1],  v[0]]])
        return m
    
class ImuDataStamped:
    def __init__(self, imu_msg=None, dt=None, time_stamp=None, frame_id=None, a_b_ib=None, w_b_ib=None):
        if imu_msg is not None:
            self.time_stamp = imu_msg.header.stamp
            self.frame_id = imu_msg.header.frame_id
            self.dt = dt
            self.a_b_ib = [imu_msg.linear_acceleration.x, imu_msg.linear_acceleration.y, imu_msg.linear_acceleration.z]
            self.w_b_ib = [imu_msg.angular_velocity.x, imu_msg.angular_velocity.y, imu_msg.angular_velocity.z]
        else:
            self.time_stamp = time_stamp
            self.frame_id = frame_id
            self.dt = dt
            self.a_b_ib = a_b_ib
            self.w_b_ib = w_b_ib

    def to_imu_msg(self):
        imu_msg = Imu()
        imu_msg.header.stamp = self.time_stamp
        imu_msg.angular_velocity.x = self.w_b_ib[0]
        imu_msg.angular_velocity.y = self.w_b_ib[1]
        imu_msg.angular_velocity.z = self.w_b_ib[2]
        imu_msg.linear_acceleration.x = self.a_b_ib[0]
        imu_msg.linear_acceleration.y = self.a_b_ib[1]
        imu_msg.linear_acceleration.z = self.a_b_ib[2]
        return imu_msg
    

class BaroAltimeter:
    def __init__(self):
        self.kPrefix = "[BaroAltimeter]: "
        self.g_0 = 9.80665
        self.M = 0.0289644
        self.R = 8.3144598
        self.T_0 = 288.15
        self.P_0 = 101320.0

    def calculate_rel_neg_height(self, pressure_msg):
        """
        Pressure to negative height conversion
        @param pressure_msg: fluid pressure ros message containing the air pressure in Pascal
        @returns the negative height in [m]
        """
        return (self.R * self.T_0) / (self.g_0 * self.M) * np.log(pressure_msg.fluid_pressure / self.P_0)
