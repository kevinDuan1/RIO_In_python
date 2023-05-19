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

class EkfRioState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.p = null;
      this.v = null;
      this.q = null;
      this.eul_deg = null;
      this.b_a = null;
      this.b_g_deg = null;
      this.b_alt = null;
      this.l_b_r = null;
      this.q_b_r = null;
      this.eul_b_r_deg = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('p')) {
        this.p = initObj.p
      }
      else {
        this.p = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('v')) {
        this.v = initObj.v
      }
      else {
        this.v = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('q')) {
        this.q = initObj.q
      }
      else {
        this.q = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('eul_deg')) {
        this.eul_deg = initObj.eul_deg
      }
      else {
        this.eul_deg = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('b_a')) {
        this.b_a = initObj.b_a
      }
      else {
        this.b_a = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('b_g_deg')) {
        this.b_g_deg = initObj.b_g_deg
      }
      else {
        this.b_g_deg = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('b_alt')) {
        this.b_alt = initObj.b_alt
      }
      else {
        this.b_alt = 0.0;
      }
      if (initObj.hasOwnProperty('l_b_r')) {
        this.l_b_r = initObj.l_b_r
      }
      else {
        this.l_b_r = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('q_b_r')) {
        this.q_b_r = initObj.q_b_r
      }
      else {
        this.q_b_r = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('eul_b_r_deg')) {
        this.eul_b_r_deg = initObj.eul_b_r_deg
      }
      else {
        this.eul_b_r_deg = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EkfRioState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [p]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.p, buffer, bufferOffset);
    // Serialize message field [v]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.v, buffer, bufferOffset);
    // Serialize message field [q]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.q, buffer, bufferOffset);
    // Serialize message field [eul_deg]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.eul_deg, buffer, bufferOffset);
    // Serialize message field [b_a]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.b_a, buffer, bufferOffset);
    // Serialize message field [b_g_deg]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.b_g_deg, buffer, bufferOffset);
    // Serialize message field [b_alt]
    bufferOffset = _serializer.float32(obj.b_alt, buffer, bufferOffset);
    // Serialize message field [l_b_r]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.l_b_r, buffer, bufferOffset);
    // Serialize message field [q_b_r]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.q_b_r, buffer, bufferOffset);
    // Serialize message field [eul_b_r_deg]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.eul_b_r_deg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EkfRioState
    let len;
    let data = new EkfRioState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [p]
    data.p = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [v]
    data.v = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [q]
    data.q = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [eul_deg]
    data.eul_deg = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [b_a]
    data.b_a = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [b_g_deg]
    data.b_g_deg = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [b_alt]
    data.b_alt = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [l_b_r]
    data.l_b_r = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [q_b_r]
    data.q_b_r = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [eul_b_r_deg]
    data.eul_b_r_deg = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 236;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ekf_rio/EkfRioState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6c5323fa7187f2894466fea406ae0fd2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    geometry_msgs/Vector3 p
    geometry_msgs/Vector3 v
    geometry_msgs/Quaternion q
    geometry_msgs/Vector3 eul_deg
    geometry_msgs/Vector3 b_a
    geometry_msgs/Vector3 b_g_deg
    float32 b_alt
    geometry_msgs/Vector3 l_b_r
    geometry_msgs/Quaternion q_b_r
    geometry_msgs/Vector3 eul_b_r_deg
    
    
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
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EkfRioState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.p !== undefined) {
      resolved.p = geometry_msgs.msg.Vector3.Resolve(msg.p)
    }
    else {
      resolved.p = new geometry_msgs.msg.Vector3()
    }

    if (msg.v !== undefined) {
      resolved.v = geometry_msgs.msg.Vector3.Resolve(msg.v)
    }
    else {
      resolved.v = new geometry_msgs.msg.Vector3()
    }

    if (msg.q !== undefined) {
      resolved.q = geometry_msgs.msg.Quaternion.Resolve(msg.q)
    }
    else {
      resolved.q = new geometry_msgs.msg.Quaternion()
    }

    if (msg.eul_deg !== undefined) {
      resolved.eul_deg = geometry_msgs.msg.Vector3.Resolve(msg.eul_deg)
    }
    else {
      resolved.eul_deg = new geometry_msgs.msg.Vector3()
    }

    if (msg.b_a !== undefined) {
      resolved.b_a = geometry_msgs.msg.Vector3.Resolve(msg.b_a)
    }
    else {
      resolved.b_a = new geometry_msgs.msg.Vector3()
    }

    if (msg.b_g_deg !== undefined) {
      resolved.b_g_deg = geometry_msgs.msg.Vector3.Resolve(msg.b_g_deg)
    }
    else {
      resolved.b_g_deg = new geometry_msgs.msg.Vector3()
    }

    if (msg.b_alt !== undefined) {
      resolved.b_alt = msg.b_alt;
    }
    else {
      resolved.b_alt = 0.0
    }

    if (msg.l_b_r !== undefined) {
      resolved.l_b_r = geometry_msgs.msg.Vector3.Resolve(msg.l_b_r)
    }
    else {
      resolved.l_b_r = new geometry_msgs.msg.Vector3()
    }

    if (msg.q_b_r !== undefined) {
      resolved.q_b_r = geometry_msgs.msg.Quaternion.Resolve(msg.q_b_r)
    }
    else {
      resolved.q_b_r = new geometry_msgs.msg.Quaternion()
    }

    if (msg.eul_b_r_deg !== undefined) {
      resolved.eul_b_r_deg = geometry_msgs.msg.Vector3.Resolve(msg.eul_b_r_deg)
    }
    else {
      resolved.eul_b_r_deg = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = EkfRioState;
