// Generated by gencpp from file tf_lookup/TfStreamFeedback.msg
// DO NOT EDIT!


#ifndef TF_LOOKUP_MESSAGE_TFSTREAMFEEDBACK_H
#define TF_LOOKUP_MESSAGE_TFSTREAMFEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tf_lookup
{
template <class ContainerAllocator>
struct TfStreamFeedback_
{
  typedef TfStreamFeedback_<ContainerAllocator> Type;

  TfStreamFeedback_()
    {
    }
  TfStreamFeedback_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct TfStreamFeedback_

typedef ::tf_lookup::TfStreamFeedback_<std::allocator<void> > TfStreamFeedback;

typedef boost::shared_ptr< ::tf_lookup::TfStreamFeedback > TfStreamFeedbackPtr;
typedef boost::shared_ptr< ::tf_lookup::TfStreamFeedback const> TfStreamFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tf_lookup::TfStreamFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tf_lookup

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'tf_lookup': ['/home/adrii/tiago_public_ws/devel/.private/tf_lookup/share/tf_lookup/msg', '/home/adrii/tiago_public_ws/src/tf_lookup/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::tf_lookup::TfStreamFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tf_lookup/TfStreamFeedback";
  }

  static const char* value(const ::tf_lookup::TfStreamFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# Define the feedback\n\
\n\
";
  }

  static const char* value(const ::tf_lookup::TfStreamFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TfStreamFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tf_lookup::TfStreamFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::tf_lookup::TfStreamFeedback_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // TF_LOOKUP_MESSAGE_TFSTREAMFEEDBACK_H
