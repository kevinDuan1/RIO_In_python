// Auto-generated. Do not edit!

// (in-package ekf_rio.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class EkfRioCovariance {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.sigma_p = null;
      this.sigma_v = null;
      this.sigma_eul_deg = null;
      this.sigma_b_a = null;
      this.sigma_b_g_deg = null;
      this.sigma_alt = null;
      this.sigma_l_b_r = null;
      this.sigma_eul_b_r_deg = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('sigma_p')) {
        this.sigma_p = initObj.sigma_p
      }
      else {
        this.sigma_p = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('sigma_v')) {
        this.sigma_v = initObj.sigma_v
      }
      else {
        this.sigma_v = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('sigma_eul_deg')) {
        this.sigma_eul_deg = initObj.sigma_eul_deg
      }
      else {
        this.sigma_eul_deg = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('sigma_b_a')) {
        this.sigma_b_a = initObj.sigma_b_a
      }
      else {
        this.sigma_b_a = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('sigma_b_g_deg')) {
        this.sigma_b_g_deg = initObj.sigma_b_g_deg
      }
      else {
        this.sigma_b_g_deg = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('sigma_alt')) {
        this.sigma_alt = initObj.sigma_alt
      }
      else {
        this.sigma_alt = 0.0;
      }
      if (initObj.hasOwnProperty('sigma_l_b_r')) {
        this.sigma_l_b_r = initObj.sigma_l_b_r
      }
      else {
        this.sigma_l_b_r = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('sigma_eul_b_r_deg')) {
        this.sigma_eul_b_r_deg = initObj.sigma_eul_b_r_deg
      }
      else {
        this.sigma_eul_b_r_deg = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EkfRioCovariance
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [sigma_p]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.sigma_p, buffer, bufferOffset);
    // Serialize message field [sigma_v]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.sigma_v, buffer, bufferOffset);
    // Serialize message field [sigma_eul_deg]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.sigma_eul_deg, buffer, bufferOffset);
    // Serialize message field [sigma_b_a]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.sigma_b_a, buffer, bufferOffset);
    // Serialize message field [sigma_b_g_deg]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.sigma_b_g_deg, buffer, bufferOffset);
    // Serialize message field [sigma_alt]
    bufferOffset = _serializer.float32(obj.sigma_alt, buffer, bufferOffset);
    // Serialize message field [sigma_l_b_r]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.sigma_l_b_r, buffer, bufferOffset);
    // Serialize message field [sigma_eul_b_r_deg]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.sigma_eul_b_r_deg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EkfRioCovariance
    let len;
    let data = new EkfRioCovariance(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [sigma_p]
    data.sigma_p = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [sigma_v]
    data.sigma_v = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [sigma_eul_deg]
    data.sigma_eul_deg = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [sigma_b_a]
    data.sigma_b_a = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [sigma_b_g_deg]
    data.sigma_b_g_deg = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [sigma_alt]
    data.sigma_alt = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sigma_l_b_r]
    data.sigma_l_b_r = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [sigma_eul_b_r_deg]
    data.sigma_eul_b_r_deg = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 172;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ekf_rio/EkfRioCovariance';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fd1c27053c1dd5f05552831fb830514c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    geometry_msgs/Vector3 sigma_p
    geometry_msgs/Vector3 sigma_v
    geometry_msgs/Vector3 sigma_eul_deg
    geometry_msgs/Vector3 sigma_b_a
    geometry_msgs/Vector3 sigma_b_g_deg
    float32 sigma_alt
    geometry_msgs/Vector3 sigma_l_b_r
    geometry_msgs/Vector3 sigma_eul_b_r_deg
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EkfRioCovariance(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.sigma_p !== undefined) {
      resolved.sigma_p = geometry_msgs.msg.Vector3.Resolve(msg.sigma_p)
    }
    else {
      resolved.sigma_p = new geometry_msgs.msg.Vector3()
    }

    if (msg.sigma_v !== undefined) {
      resolved.sigma_v = geometry_msgs.msg.Vector3.Resolve(msg.sigma_v)
    }
    else {
      resolved.sigma_v = new geometry_msgs.msg.Vector3()
    }

    if (msg.sigma_eul_deg !== undefined) {
      resolved.sigma_eul_deg = geometry_msgs.msg.Vector3.Resolve(msg.sigma_eul_deg)
    }
    else {
      resolved.sigma_eul_deg = new geometry_msgs.msg.Vector3()
    }

    if (msg.sigma_b_a !== undefined) {
      resolved.sigma_b_a = geometry_msgs.msg.Vector3.Resolve(msg.sigma_b_a)
    }
    else {
      resolved.sigma_b_a = new geometry_msgs.msg.Vector3()
    }

    if (msg.sigma_b_g_deg !== undefined) {
      resolved.sigma_b_g_deg = geometry_msgs.msg.Vector3.Resolve(msg.sigma_b_g_deg)
    }
    else {
      resolved.sigma_b_g_deg = new geometry_msgs.msg.Vector3()
    }

    if (msg.sigma_alt !== undefined) {
      resolved.sigma_alt = msg.sigma_alt;
    }
    else {
      resolved.sigma_alt = 0.0
    }

    if (msg.sigma_l_b_r !== undefined) {
      resolved.sigma_l_b_r = geometry_msgs.msg.Vector3.Resolve(msg.sigma_l_b_r)
    }
    else {
      resolved.sigma_l_b_r = new geometry_msgs.msg.Vector3()
    }

    if (msg.sigma_eul_b_r_deg !== undefined) {
      resolved.sigma_eul_b_r_deg = geometry_msgs.msg.Vector3.Resolve(msg.sigma_eul_b_r_deg)
    }
    else {
      resolved.sigma_eul_b_r_deg = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = EkfRioCovariance;
