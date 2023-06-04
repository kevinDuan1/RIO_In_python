#!/usr/bin/python
import sensor_msgs.point_cloud2 as pc2
from sensor_msgs.msg import PointCloud2, PointField
import numpy as np
import rospy

class RadarPointCloudType:
    def __init__(self):
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
        self.snr_db = 0.0
        self.v_doppler_mps = 0.0
        self.noise_db = 0.0
        self.range = 0.0

class mmWaveCloudType:
    def __init__(self):
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
        self.intensity = 0.0
        self.velocity = 0.0

# converter : pointcloud 2 to RadarPoint cloud type
def pcl2msgToPcl(radar_scan_msg, inlier_radar_msg):
    flag_radar = True
    flag_mmwave = True
    str_field = ["x", "y", "z", "snr_db", "noise_db", "v_doppler_mps"]
    str_field1 = ['x', 'y', 'z', 'intensity', 'velocity']

    for field in radar_scan_msg.fields: # RIO PointCloud2
        if str_field.count(field.name) == 0:
            flag_radar = False
            break

    for field in radar_scan_msg.fields: # mmave PointCloud2
        if str_field1.count(field.name) == 0:
            flag_mmwave = False
            break

    if flag_radar:        
        for point in pc2.read_points(radar_scan_msg, field_names=("x", "y", "z", "snr_db", "noise_db", "v_doppler_mps"), skip_nans=True):
            rt = RadarPointCloudType()
            rt.x = point[0]; rt.y = point[1]; rt.z = point[2]
            rt.snr_db = point[3]; rt.noise_db = point[5]; rt.v_doppler_mps = point[4]
            inlier_radar_msg.append(rt)
        return True
    
    elif flag_mmwave:        
        for point in pc2.read_points(radar_scan_msg, field_names=("x", "y", "z", "intensity", "velocity"), skip_nans=True):
            rt = RadarPointCloudType()
            rt.x = -point[1]; rt.y = point[0]; rt.z = point[2]
            rt.snr_db = point[3]; rt.noise_db = -1; rt.v_doppler_mps = point[4]
            inlier_radar_msg.append(rt)
        return True
    rospy.logerr('unsupported point cloud!')
    return False

# convert back
def pclToPcl2msg(radar_scan_inlier, header):
    fields1 = [
        PointField(name='x', offset=0, datatype=PointField.FLOAT32, count=1),
        PointField(name='y', offset=4, datatype=PointField.FLOAT32, count=1),
        PointField(name='z', offset=8, datatype=PointField.FLOAT32, count=1),
        PointField(name='snr_db', offset=20, datatype=PointField.FLOAT32, count=1),
        PointField(name='noise_db', offset=28, datatype=PointField.FLOAT32, count=1),
        PointField(name='v_doppler_mps', offset=24, datatype=PointField.FLOAT32, count=1),
    ]
    points = np.zeros((len(radar_scan_inlier), 6))
    for i in range(0, len(radar_scan_inlier)):
        points[i][0] = radar_scan_inlier[i].x
        points[i][1] = radar_scan_inlier[i].y
        points[i][2] = radar_scan_inlier[i].z
        points[i][3] = radar_scan_inlier[i].snr_db
        points[i][5] = radar_scan_inlier[i].noise_db
        points[i][4] = radar_scan_inlier[i].v_doppler_mps
    
    inlier_radar_msg = pc2.create_cloud(header, fields1, points)
    inlier_radar_msg.is_dense= True
    return inlier_radar_msg, True
 

