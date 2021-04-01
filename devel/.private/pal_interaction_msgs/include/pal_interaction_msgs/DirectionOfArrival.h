// Generated by gencpp from file pal_interaction_msgs/DirectionOfArrival.msg
// DO NOT EDIT!


#ifndef PAL_INTERACTION_MSGS_MESSAGE_DIRECTIONOFARRIVAL_H
#define PAL_INTERACTION_MSGS_MESSAGE_DIRECTIONOFARRIVAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pal_interaction_msgs
{
template <class ContainerAllocator>
struct DirectionOfArrival_
{
  typedef DirectionOfArrival_<ContainerAllocator> Type;

  DirectionOfArrival_()
    : doa(0.0)
    , prob(0.0)
    , power(0.0)
    , metadoa()  {
    }
  DirectionOfArrival_(const ContainerAllocator& _alloc)
    : doa(0.0)
    , prob(0.0)
    , power(0.0)
    , metadoa(_alloc)  {
  (void)_alloc;
    }



   typedef float _doa_type;
  _doa_type doa;

   typedef float _prob_type;
  _prob_type prob;

   typedef float _power_type;
  _power_type power;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _metadoa_type;
  _metadoa_type metadoa;





  typedef boost::shared_ptr< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> const> ConstPtr;

}; // struct DirectionOfArrival_

typedef ::pal_interaction_msgs::DirectionOfArrival_<std::allocator<void> > DirectionOfArrival;

typedef boost::shared_ptr< ::pal_interaction_msgs::DirectionOfArrival > DirectionOfArrivalPtr;
typedef boost::shared_ptr< ::pal_interaction_msgs::DirectionOfArrival const> DirectionOfArrivalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pal_interaction_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'pal_interaction_msgs': ['/home/adrii/tiago_public_ws/src/pal_msgs/pal_interaction_msgs/msg', '/home/adrii/tiago_public_ws/devel/.private/pal_interaction_msgs/share/pal_interaction_msgs/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cbcea81e85fdde7bb3d71de75dea9f5c";
  }

  static const char* value(const ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcbcea81e85fdde7bULL;
  static const uint64_t static_value2 = 0xb3d71de75dea9f5cULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_interaction_msgs/DirectionOfArrival";
  }

  static const char* value(const ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 doa\n\
float32 prob\n\
float32 power\n\
string metadoa\n\
";
  }

  static const char* value(const ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.doa);
      stream.next(m.prob);
      stream.next(m.power);
      stream.next(m.metadoa);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DirectionOfArrival_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pal_interaction_msgs::DirectionOfArrival_<ContainerAllocator>& v)
  {
    s << indent << "doa: ";
    Printer<float>::stream(s, indent + "  ", v.doa);
    s << indent << "prob: ";
    Printer<float>::stream(s, indent + "  ", v.prob);
    s << indent << "power: ";
    Printer<float>::stream(s, indent + "  ", v.power);
    s << indent << "metadoa: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.metadoa);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PAL_INTERACTION_MSGS_MESSAGE_DIRECTIONOFARRIVAL_H
