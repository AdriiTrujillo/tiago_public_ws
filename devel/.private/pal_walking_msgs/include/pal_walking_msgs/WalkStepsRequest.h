// Generated by gencpp from file pal_walking_msgs/WalkStepsRequest.msg
// DO NOT EDIT!


#ifndef PAL_WALKING_MSGS_MESSAGE_WALKSTEPSREQUEST_H
#define PAL_WALKING_MSGS_MESSAGE_WALKSTEPSREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pal_walking_msgs
{
template <class ContainerAllocator>
struct WalkStepsRequest_
{
  typedef WalkStepsRequest_<ContainerAllocator> Type;

  WalkStepsRequest_()
    : nsteps(0)
    , step_length(0.0)
    , step_time(0.0)  {
    }
  WalkStepsRequest_(const ContainerAllocator& _alloc)
    : nsteps(0)
    , step_length(0.0)
    , step_time(0.0)  {
  (void)_alloc;
    }



   typedef int32_t _nsteps_type;
  _nsteps_type nsteps;

   typedef double _step_length_type;
  _step_length_type step_length;

   typedef double _step_time_type;
  _step_time_type step_time;





  typedef boost::shared_ptr< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> const> ConstPtr;

}; // struct WalkStepsRequest_

typedef ::pal_walking_msgs::WalkStepsRequest_<std::allocator<void> > WalkStepsRequest;

typedef boost::shared_ptr< ::pal_walking_msgs::WalkStepsRequest > WalkStepsRequestPtr;
typedef boost::shared_ptr< ::pal_walking_msgs::WalkStepsRequest const> WalkStepsRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pal_walking_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'pal_walking_msgs': ['/home/adrii/tiago_public_ws/src/pal_msgs/pal_walking_msgs/msg'], 'humanoid_nav_msgs': ['/opt/ros/kinetic/share/humanoid_nav_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "58a83587aa65e3865f04c9ed9e7cdaaf";
  }

  static const char* value(const ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x58a83587aa65e386ULL;
  static const uint64_t static_value2 = 0x5f04c9ed9e7cdaafULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_walking_msgs/WalkStepsRequest";
  }

  static const char* value(const ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
\n\
\n\
int32     nsteps\n\
float64   step_length\n\
float64   step_time\n\
";
  }

  static const char* value(const ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.nsteps);
      stream.next(m.step_length);
      stream.next(m.step_time);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct WalkStepsRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pal_walking_msgs::WalkStepsRequest_<ContainerAllocator>& v)
  {
    s << indent << "nsteps: ";
    Printer<int32_t>::stream(s, indent + "  ", v.nsteps);
    s << indent << "step_length: ";
    Printer<double>::stream(s, indent + "  ", v.step_length);
    s << indent << "step_time: ";
    Printer<double>::stream(s, indent + "  ", v.step_time);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PAL_WALKING_MSGS_MESSAGE_WALKSTEPSREQUEST_H
