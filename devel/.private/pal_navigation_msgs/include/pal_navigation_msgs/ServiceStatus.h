// Generated by gencpp from file pal_navigation_msgs/ServiceStatus.msg
// DO NOT EDIT!


#ifndef PAL_NAVIGATION_MSGS_MESSAGE_SERVICESTATUS_H
#define PAL_NAVIGATION_MSGS_MESSAGE_SERVICESTATUS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pal_navigation_msgs
{
template <class ContainerAllocator>
struct ServiceStatus_
{
  typedef ServiceStatus_<ContainerAllocator> Type;

  ServiceStatus_()
    : serviceName()
    , is_running(false)
    , update_frequency(0.0)
    , latest_run_time()
    , status(false)  {
    }
  ServiceStatus_(const ContainerAllocator& _alloc)
    : serviceName(_alloc)
    , is_running(false)
    , update_frequency(0.0)
    , latest_run_time()
    , status(false)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _serviceName_type;
  _serviceName_type serviceName;

   typedef uint8_t _is_running_type;
  _is_running_type is_running;

   typedef float _update_frequency_type;
  _update_frequency_type update_frequency;

   typedef ros::Time _latest_run_time_type;
  _latest_run_time_type latest_run_time;

   typedef uint8_t _status_type;
  _status_type status;





  typedef boost::shared_ptr< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> const> ConstPtr;

}; // struct ServiceStatus_

typedef ::pal_navigation_msgs::ServiceStatus_<std::allocator<void> > ServiceStatus;

typedef boost::shared_ptr< ::pal_navigation_msgs::ServiceStatus > ServiceStatusPtr;
typedef boost::shared_ptr< ::pal_navigation_msgs::ServiceStatus const> ServiceStatusConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pal_navigation_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'pal_navigation_msgs': ['/home/adrii/tiago_public_ws/devel/.private/pal_navigation_msgs/share/pal_navigation_msgs/msg', '/home/adrii/tiago_public_ws/src/pal_msgs/pal_navigation_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b734cea5bf73c81e5fb0d99553451daa";
  }

  static const char* value(const ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb734cea5bf73c81eULL;
  static const uint64_t static_value2 = 0x5fb0d99553451daaULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_navigation_msgs/ServiceStatus";
  }

  static const char* value(const ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Navigation ServiceStatus msg \n\
string serviceName\n\
\n\
#true if the service has been started\n\
bool    is_running\n\
\n\
#expected frequency of control loop (in hertz)\n\
float32 update_frequency\n\
\n\
#Timestamp of the latest loop cycle execution\n\
time    latest_run_time\n\
\n\
#true if the service is running and working fine\n\
bool    status\n\
";
  }

  static const char* value(const ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.serviceName);
      stream.next(m.is_running);
      stream.next(m.update_frequency);
      stream.next(m.latest_run_time);
      stream.next(m.status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ServiceStatus_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pal_navigation_msgs::ServiceStatus_<ContainerAllocator>& v)
  {
    s << indent << "serviceName: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.serviceName);
    s << indent << "is_running: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.is_running);
    s << indent << "update_frequency: ";
    Printer<float>::stream(s, indent + "  ", v.update_frequency);
    s << indent << "latest_run_time: ";
    Printer<ros::Time>::stream(s, indent + "  ", v.latest_run_time);
    s << indent << "status: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.status);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PAL_NAVIGATION_MSGS_MESSAGE_SERVICESTATUS_H
