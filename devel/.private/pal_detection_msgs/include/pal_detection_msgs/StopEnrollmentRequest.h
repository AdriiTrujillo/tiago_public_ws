// Generated by gencpp from file pal_detection_msgs/StopEnrollmentRequest.msg
// DO NOT EDIT!


#ifndef PAL_DETECTION_MSGS_MESSAGE_STOPENROLLMENTREQUEST_H
#define PAL_DETECTION_MSGS_MESSAGE_STOPENROLLMENTREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pal_detection_msgs
{
template <class ContainerAllocator>
struct StopEnrollmentRequest_
{
  typedef StopEnrollmentRequest_<ContainerAllocator> Type;

  StopEnrollmentRequest_()
    {
    }
  StopEnrollmentRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> const> ConstPtr;

}; // struct StopEnrollmentRequest_

typedef ::pal_detection_msgs::StopEnrollmentRequest_<std::allocator<void> > StopEnrollmentRequest;

typedef boost::shared_ptr< ::pal_detection_msgs::StopEnrollmentRequest > StopEnrollmentRequestPtr;
typedef boost::shared_ptr< ::pal_detection_msgs::StopEnrollmentRequest const> StopEnrollmentRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pal_detection_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'pal_detection_msgs': ['/home/adrii/tiago_public_ws/src/pal_msgs/pal_detection_msgs/msg', '/home/adrii/tiago_public_ws/devel/.private/pal_detection_msgs/share/pal_detection_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_detection_msgs/StopEnrollmentRequest";
  }

  static const char* value(const ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct StopEnrollmentRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::pal_detection_msgs::StopEnrollmentRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // PAL_DETECTION_MSGS_MESSAGE_STOPENROLLMENTREQUEST_H
