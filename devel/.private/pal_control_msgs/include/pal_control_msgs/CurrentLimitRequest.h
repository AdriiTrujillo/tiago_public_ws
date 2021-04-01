// Generated by gencpp from file pal_control_msgs/CurrentLimitRequest.msg
// DO NOT EDIT!


#ifndef PAL_CONTROL_MSGS_MESSAGE_CURRENTLIMITREQUEST_H
#define PAL_CONTROL_MSGS_MESSAGE_CURRENTLIMITREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pal_control_msgs
{
template <class ContainerAllocator>
struct CurrentLimitRequest_
{
  typedef CurrentLimitRequest_<ContainerAllocator> Type;

  CurrentLimitRequest_()
    : actuator_name()
    , current_limit(0.0)  {
    }
  CurrentLimitRequest_(const ContainerAllocator& _alloc)
    : actuator_name(_alloc)
    , current_limit(0.0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _actuator_name_type;
  _actuator_name_type actuator_name;

   typedef double _current_limit_type;
  _current_limit_type current_limit;





  typedef boost::shared_ptr< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> const> ConstPtr;

}; // struct CurrentLimitRequest_

typedef ::pal_control_msgs::CurrentLimitRequest_<std::allocator<void> > CurrentLimitRequest;

typedef boost::shared_ptr< ::pal_control_msgs::CurrentLimitRequest > CurrentLimitRequestPtr;
typedef boost::shared_ptr< ::pal_control_msgs::CurrentLimitRequest const> CurrentLimitRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pal_control_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'pal_control_msgs': ['/home/adrii/tiago_public_ws/src/pal_msgs/pal_control_msgs/msg', '/home/adrii/tiago_public_ws/devel/.private/pal_control_msgs/share/pal_control_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6d1326759cec3fceb10a88d2834f6fba";
  }

  static const char* value(const ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6d1326759cec3fceULL;
  static const uint64_t static_value2 = 0xb10a88d2834f6fbaULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_control_msgs/CurrentLimitRequest";
  }

  static const char* value(const ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
\n\
\n\
\n\
string    actuator_name\n\
float64   current_limit\n\
\n\
";
  }

  static const char* value(const ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.actuator_name);
      stream.next(m.current_limit);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CurrentLimitRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pal_control_msgs::CurrentLimitRequest_<ContainerAllocator>& v)
  {
    s << indent << "actuator_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.actuator_name);
    s << indent << "current_limit: ";
    Printer<double>::stream(s, indent + "  ", v.current_limit);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PAL_CONTROL_MSGS_MESSAGE_CURRENTLIMITREQUEST_H
