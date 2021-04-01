// Generated by gencpp from file pal_device_msgs/BatteryState.msg
// DO NOT EDIT!


#ifndef PAL_DEVICE_MSGS_MESSAGE_BATTERYSTATE_H
#define PAL_DEVICE_MSGS_MESSAGE_BATTERYSTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pal_device_msgs
{
template <class ContainerAllocator>
struct BatteryState_
{
  typedef BatteryState_<ContainerAllocator> Type;

  BatteryState_()
    : chargeState(0)
    , batteryPercentage(0.0)  {
    }
  BatteryState_(const ContainerAllocator& _alloc)
    : chargeState(0)
    , batteryPercentage(0.0)  {
  (void)_alloc;
    }



   typedef int8_t _chargeState_type;
  _chargeState_type chargeState;

   typedef float _batteryPercentage_type;
  _batteryPercentage_type batteryPercentage;



  enum {
    FULL = 5,
    HIGH = 4,
    MEDIUM = 3,
    LOW = 2,
    CRITICAL_LOW = 1,
  };


  typedef boost::shared_ptr< ::pal_device_msgs::BatteryState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_device_msgs::BatteryState_<ContainerAllocator> const> ConstPtr;

}; // struct BatteryState_

typedef ::pal_device_msgs::BatteryState_<std::allocator<void> > BatteryState;

typedef boost::shared_ptr< ::pal_device_msgs::BatteryState > BatteryStatePtr;
typedef boost::shared_ptr< ::pal_device_msgs::BatteryState const> BatteryStateConstPtr;

// constants requiring out of line definition

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_device_msgs::BatteryState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_device_msgs::BatteryState_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pal_device_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'pal_device_msgs': ['/home/adrii/tiago_public_ws/src/pal_msgs/pal_device_msgs/msg', '/home/adrii/tiago_public_ws/devel/.private/pal_device_msgs/share/pal_device_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pal_device_msgs::BatteryState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_device_msgs::BatteryState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_device_msgs::BatteryState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_device_msgs::BatteryState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_device_msgs::BatteryState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_device_msgs::BatteryState_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_device_msgs::BatteryState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ffbf73d789e375a8bace732de9096d5f";
  }

  static const char* value(const ::pal_device_msgs::BatteryState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xffbf73d789e375a8ULL;
  static const uint64_t static_value2 = 0xbace732de9096d5fULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_device_msgs::BatteryState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_device_msgs/BatteryState";
  }

  static const char* value(const ::pal_device_msgs::BatteryState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_device_msgs::BatteryState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "byte FULL = 5\n\
byte HIGH = 4\n\
byte MEDIUM = 3\n\
byte LOW = 2\n\
byte CRITICAL_LOW = 1\n\
\n\
#In the future we can use http://www.ros.org/doc/api/pr2_msgs/html/msg/PowerState.html\n\
\n\
int8 chargeState\n\
float32 batteryPercentage\n\
\n\
";
  }

  static const char* value(const ::pal_device_msgs::BatteryState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_device_msgs::BatteryState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.chargeState);
      stream.next(m.batteryPercentage);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BatteryState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_device_msgs::BatteryState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pal_device_msgs::BatteryState_<ContainerAllocator>& v)
  {
    s << indent << "chargeState: ";
    Printer<int8_t>::stream(s, indent + "  ", v.chargeState);
    s << indent << "batteryPercentage: ";
    Printer<float>::stream(s, indent + "  ", v.batteryPercentage);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PAL_DEVICE_MSGS_MESSAGE_BATTERYSTATE_H
