// Generated by gencpp from file practica_servicios/geograspRequest.msg
// DO NOT EDIT!


#ifndef PRACTICA_SERVICIOS_MESSAGE_GEOGRASPREQUEST_H
#define PRACTICA_SERVICIOS_MESSAGE_GEOGRASPREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace practica_servicios
{
template <class ContainerAllocator>
struct geograspRequest_
{
  typedef geograspRequest_<ContainerAllocator> Type;

  geograspRequest_()
    {
    }
  geograspRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::practica_servicios::geograspRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::practica_servicios::geograspRequest_<ContainerAllocator> const> ConstPtr;

}; // struct geograspRequest_

typedef ::practica_servicios::geograspRequest_<std::allocator<void> > geograspRequest;

typedef boost::shared_ptr< ::practica_servicios::geograspRequest > geograspRequestPtr;
typedef boost::shared_ptr< ::practica_servicios::geograspRequest const> geograspRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::practica_servicios::geograspRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::practica_servicios::geograspRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace practica_servicios

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::practica_servicios::geograspRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::practica_servicios::geograspRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::practica_servicios::geograspRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::practica_servicios::geograspRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::practica_servicios::geograspRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::practica_servicios::geograspRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::practica_servicios::geograspRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::practica_servicios::geograspRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::practica_servicios::geograspRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "practica_servicios/geograspRequest";
  }

  static const char* value(const ::practica_servicios::geograspRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::practica_servicios::geograspRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::practica_servicios::geograspRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::practica_servicios::geograspRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct geograspRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::practica_servicios::geograspRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::practica_servicios::geograspRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // PRACTICA_SERVICIOS_MESSAGE_GEOGRASPREQUEST_H
