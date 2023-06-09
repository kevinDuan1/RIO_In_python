import numpy as np

class Ekf_Rio_config:

    def __init__(self):
        self.noise_psd_a = 0.03 # 0 to 1
        self.noise_psd_b_a = 0.00001 # 0 to 1
        self.noise_psd_w_deg = 0.2 # 0 to 1
        self.noise_psd_b_w_deg = 0.00001 # 0 to 1
        self.p_0_x = 0.0 # -100 to 100
        self.p_0_y = 0.0 # -100 to 100
        self.p_0_z = 0.0 # -100 to 100
        self.v_0_x = 0.0 # -5 to 5
        self.v_0_y = 0.0 # -5 to 5
        self.v_0_z = 0.0 # -5 to 5
        self.yaw_0_deg = 0.0 # -360 to 360
        self.b_0_a_x = 0.0 # -2.0 to 2
        self.b_0_a_y = 0.0 # -2 to 2
        self.b_0_a_z = 0.0 # -2 to 2
        self.b_0_w_x_deg = 0.0 # -1 to 1
        self.b_0_w_y_deg = 0.0 # -1 to 1
        self.b_0_w_z_deg = -0.050000021428783986 # -1 to 1
        self.b_0_alt = 0.0 # -100 to 100
        self.l_b_r_x = 0.03 # -1 to 1
        self.l_b_r_y = 0.03 # -1 to 1
        self.l_b_r_z = -0.06 # -1 to 1
        self.q_b_r_w = 0.00524 # -1 to 1 
        self.q_b_r_x = 0.69946 # -1 to 1
        self.q_b_r_y = 0.71461 # -1 to 1
        self.q_b_r_z = 0.00723 # -1 to 1
        
        self.sigma_p = 0.0 # 0.0 to 1000.0
        self.sigma_v = 0.0 # 0.0 to 1000.0
        self.sigma_roll_pitch_deg = 0 # 0 to 360
        self.sigma_yaw_deg = 0 # 0 to 360 
        self.sigma_b_a = 0.02 # 0 to 1
        self.sigma_b_w_deg = 0.000003 # 0 to 1
        self.sigma_b_alt = 0.1 # 1000
        self.sigma_l_b_r_x = 0.01 # 0 to 1
        self.sigma_l_b_r_y = 0.01 # 0 to 1
        self.sigma_l_b_r_z = 0.01 # 0 to 1
        self.sigma_eul_b_r_roll_deg = 0.25 # 0 to 360
        self.sigma_eul_b_r_pitch_deg = 0.25 # 0 to 360
        self.sigma_eul_b_r_yaw_deg = 0.25 # 0 to 360
        self.g_n = 9.81
        self.calib_gyro = 1 
        self.T_init = 10.0
        self.altimeter_update = 1
        self.radar_frame_ms = 18.5
        self.sigma_altimeter = 5.0
        self.radar_update = 1
        self.run_without_radar_trigger = 0
        self.radar_rate = 10.0
        self.use_w = 1
        self.noise_psd_b_alt = 0.000001 # 0 to 1
        self.outlier_percentil_radar = 0.05
        self.publisher_rate = 30
        self.Transfrom = np.array([[0, -1, 0], [-1, 0 , 0], [0, 0, -1]])