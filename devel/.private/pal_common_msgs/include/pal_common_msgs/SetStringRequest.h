// Generated by gencpp from file pal_common_msgs/SetStringRequest.msg
// DO NOT EDIT!


#ifndef PAL_COMMON_MSGS_MESSAGE_SETSTRINGREQUEST_H
#define PAL_COMMON_MSGS_MESSAGE_SETSTRINGREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pal_common_msgs
{
template <class ContainerAllocator>
struct SetStringRequest_
{
  typedef SetStringRequest_<ContainerAllocator> Type;

  SetStringRequest_()
    : data()  {
    }
  SetStringRequest_(const ContainerAllocator& _alloc)
    : data(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetStringRequest_

typedef ::pal_common_msgs::SetStringRequest_<std::allocator<void> > SetStringRequest;

typedef boost::shared_ptr< ::pal_common_msgs::SetStringRequest > SetStringRequestPtr;
typedef boost::shared_ptr< ::pal_common_msgs::SetStringRequest const> SetStringRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_common_msgs::SetStringRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pal_common_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'pal_common_msgs': ['/home/adrii/tiago_public_ws/devel/.private/pal_common_msgs/share/pal_common_msgs/msg', '/home/adrii/tiago_public_ws/src/pal_msgs/pal_common_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "992ce8a1687cec8c8bd883ec73ca41d1";
  }

  static const char* value(const ::pal_common_msgs::SetStringRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x992ce8a1687cec8cULL;
  static const uint64_t static_value2 = 0x8bd883ec73ca41d1ULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_common_msgs/SetStringRequest";
  }

  static const char* value(const ::pal_common_msgs::SetStringRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string data\n\
";
  }

  static const char* value(const ::pal_common_msgs::SetStringRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetStringRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_common_msgs::SetStringRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pal_common_msgs::SetStringRequest_<ContainerAllocator>& v)
  {
    s << indent << "data: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PAL_COMMON_MSGS_MESSAGE_SETSTRINGREQUEST_H
