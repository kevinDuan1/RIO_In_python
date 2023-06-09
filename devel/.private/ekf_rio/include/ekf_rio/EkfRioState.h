// Generated by gencpp from file ekf_rio/EkfRioState.msg
// DO NOT EDIT!


#ifndef EKF_RIO_MESSAGE_EKFRIOSTATE_H
#define EKF_RIO_MESSAGE_EKFRIOSTATE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/Vector3.h>

namespace ekf_rio
{
template <class ContainerAllocator>
struct EkfRioState_
{
  typedef EkfRioState_<ContainerAllocator> Type;

  EkfRioState_()
    : header()
    , p()
    , v()
    , q()
    , eul_deg()
    , b_a()
    , b_g_deg()
    , b_alt(0.0)
    , l_b_r()
    , q_b_r()
    , eul_b_r_deg()  {
    }
  EkfRioState_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , p(_alloc)
    , v(_alloc)
    , q(_alloc)
    , eul_deg(_alloc)
    , b_a(_alloc)
    , b_g_deg(_alloc)
    , b_alt(0.0)
    , l_b_r(_alloc)
    , q_b_r(_alloc)
    , eul_b_r_deg(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _p_type;
  _p_type p;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _v_type;
  _v_type v;

   typedef  ::geometry_msgs::Quaternion_<ContainerAllocator>  _q_type;
  _q_type q;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _eul_deg_type;
  _eul_deg_type eul_deg;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _b_a_type;
  _b_a_type b_a;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _b_g_deg_type;
  _b_g_deg_type b_g_deg;

   typedef float _b_alt_type;
  _b_alt_type b_alt;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _l_b_r_type;
  _l_b_r_type l_b_r;

   typedef  ::geometry_msgs::Quaternion_<ContainerAllocator>  _q_b_r_type;
  _q_b_r_type q_b_r;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _eul_b_r_deg_type;
  _eul_b_r_deg_type eul_b_r_deg;





  typedef boost::shared_ptr< ::ekf_rio::EkfRioState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ekf_rio::EkfRioState_<ContainerAllocator> const> ConstPtr;

}; // struct EkfRioState_

typedef ::ekf_rio::EkfRioState_<std::allocator<void> > EkfRioState;

typedef boost::shared_ptr< ::ekf_rio::EkfRioState > EkfRioStatePtr;
typedef boost::shared_ptr< ::ekf_rio::EkfRioState const> EkfRioStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ekf_rio::EkfRioState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ekf_rio::EkfRioState_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ekf_rio::EkfRioState_<ContainerAllocator1> & lhs, const ::ekf_rio::EkfRioState_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.p == rhs.p &&
    lhs.v == rhs.v &&
    lhs.q == rhs.q &&
    lhs.eul_deg == rhs.eul_deg &&
    lhs.b_a == rhs.b_a &&
    lhs.b_g_deg == rhs.b_g_deg &&
    lhs.b_alt == rhs.b_alt &&
    lhs.l_b_r == rhs.l_b_r &&
    lhs.q_b_r == rhs.q_b_r &&
    lhs.eul_b_r_deg == rhs.eul_b_r_deg;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ekf_rio::EkfRioState_<ContainerAllocator1> & lhs, const ::ekf_rio::EkfRioState_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ekf_rio

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ekf_rio::EkfRioState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ekf_rio::EkfRioState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ekf_rio::EkfRioState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ekf_rio::EkfRioState_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ekf_rio::EkfRioState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ekf_rio::EkfRioState_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ekf_rio::EkfRioState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6c5323fa7187f2894466fea406ae0fd2";
  }

  static const char* value(const ::ekf_rio::EkfRioState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6c5323fa7187f289ULL;
  static const uint64_t static_value2 = 0x4466fea406ae0fd2ULL;
};

template<class ContainerAllocator>
struct DataType< ::ekf_rio::EkfRioState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ekf_rio/EkfRioState";
  }

  static const char* value(const ::ekf_rio::EkfRioState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ekf_rio::EkfRioState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"\n"
"geometry_msgs/Vector3 p\n"
"geometry_msgs/Vector3 v\n"
"geometry_msgs/Quaternion q\n"
"geometry_msgs/Vector3 eul_deg\n"
"geometry_msgs/Vector3 b_a\n"
"geometry_msgs/Vector3 b_g_deg\n"
"float32 b_alt\n"
"geometry_msgs/Vector3 l_b_r\n"
"geometry_msgs/Quaternion q_b_r\n"
"geometry_msgs/Vector3 eul_b_r_deg\n"
"\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
;
  }

  static const char* value(const ::ekf_rio::EkfRioState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ekf_rio::EkfRioState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.p);
      stream.next(m.v);
      stream.next(m.q);
      stream.next(m.eul_deg);
      stream.next(m.b_a);
      stream.next(m.b_g_deg);
      stream.next(m.b_alt);
      stream.next(m.l_b_r);
      stream.next(m.q_b_r);
      stream.next(m.eul_b_r_deg);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct EkfRioState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ekf_rio::EkfRioState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ekf_rio::EkfRioState_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "p: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.p);
    s << indent << "v: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.v);
    s << indent << "q: ";
    s << std::endl;
    Printer< ::geometry_msgs::Quaternion_<ContainerAllocator> >::stream(s, indent + "  ", v.q);
    s << indent << "eul_deg: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.eul_deg);
    s << indent << "b_a: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.b_a);
    s << indent << "b_g_deg: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.b_g_deg);
    s << indent << "b_alt: ";
    Printer<float>::stream(s, indent + "  ", v.b_alt);
    s << indent << "l_b_r: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.l_b_r);
    s << indent << "q_b_r: ";
    s << std::endl;
    Printer< ::geometry_msgs::Quaternion_<ContainerAllocator> >::stream(s, indent + "  ", v.q_b_r);
    s << indent << "eul_b_r_deg: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.eul_b_r_deg);
  }
};

} // namespace message_operations
} // namespace ros

#endif // EKF_RIO_MESSAGE_EKFRIOSTATE_H
