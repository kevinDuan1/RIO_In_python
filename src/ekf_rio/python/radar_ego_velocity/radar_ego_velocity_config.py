#!/usr/bin/python
class Radar_ego_velocity_config:
    def __init__(self):
        self.success_prob = 0.9999 # min 0 max 1
        self.outlier_prob = 0.4 # min 0 max 1
        self.N_ransac_points = 3 # min 3 max 20
        self.min_dist = 0.25 # 0 to 100
        self.max_dist = 100.0 # 0 to 1000
        self.min_db = 5.0 # 0 to 50
        self.azimuth_thresh_deg = 60 # 0 to 100
        self.elevation_thresh_deg = 60 # 0 to 100
        self.filter_min_z = -100 # -1000 to 1000
        self.filter_max_z = 100 # -1000 to 1000
        self.doppler_velocity_correction_factor = 1.0 #0 to 2
        self.allowed_outlier_percentage = 0.75 # 0 to 1
        self.thresh_zero_velocity = 0.05 #0 to 10
        self.sigma_zero_velocity_x = 0.01 # 0 to 10
        self.sigma_zero_velocity_y = 0.01 # 0 to 10
        self.sigma_zero_velocity_z = 0.01 # 0 to 10
        self.use_ransac = 1 # 1 or 0
        self.use_odr = 1 # 0 or 1
        self.min_speed_odr = 4.0 # 0 to 100.0
        self.inlier_thresh = 0.15 # 0 to 2
        self.use_cholesky_instead_of_bdcsvd = 1 # 0 or 1
        self.sigma_offset_radar_x = 0.0 # 0 to 10
        self.sigma_offset_radar_y = 0.0 # 0 to 10
        self.sigma_offset_radar_z = 0.0 # 0 to 10
        self.max_sigma_x = 0.1 # 0 to 10
        self.max_sigma_y = 0.1 # 0 to 10
        self.max_sigma_z = 0.1 # 0 to 10
        self.sigma_v_d = 0.125 # 0 to 10
        self.model_noise_offset_deg = 1.0 # 0 to 100
        self.model_noise_scale_deg = 1.0 # 0 to 100