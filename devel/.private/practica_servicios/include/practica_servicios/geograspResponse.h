// Generated by gencpp from file practica_servicios/geograspResponse.msg
// DO NOT EDIT!


#ifndef PRACTICA_SERVICIOS_MESSAGE_GEOGRASPRESPONSE_H
#define PRACTICA_SERVICIOS_MESSAGE_GEOGRASPRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Pose.h>

namespace practica_servicios
{
template <class ContainerAllocator>
struct geograspResponse_
{
  typedef geograspResponse_<ContainerAllocator> Type;

  geograspResponse_()
    : p()  {
    }
  geograspResponse_(const ContainerAllocator& _alloc)
    : p(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _p_type;
  _p_type p;





  typedef boost::shared_ptr< ::practica_servicios::geograspResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::practica_servicios::geograspResponse_<ContainerAllocator> const> ConstPtr;

}; // struct geograspResponse_

typedef ::practica_servicios::geograspResponse_<std::allocator<void> > geograspResponse;

typedef boost::shared_ptr< ::practica_servicios::geograspResponse > geograspResponsePtr;
typedef boost::shared_ptr< ::practica_servicios::geograspResponse const> geograspResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::practica_servicios::geograspResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::practica_servicios::geograspResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::practica_servicios::geograspResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::practica_servicios::geograspResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::practica_servicios::geograspResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::practica_servicios::geograspResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::practica_servicios::geograspResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::practica_servicios::geograspResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::practica_servicios::geograspResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f99e2553a5b4745dfc6f3efd371b9886";
  }

  static const char* value(const ::practica_servicios::geograspResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf99e2553a5b4745dULL;
  static const uint64_t static_value2 = 0xfc6f3efd371b9886ULL;
};

template<class ContainerAllocator>
struct DataType< ::practica_servicios::geograspResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "practica_servicios/geograspResponse";
  }

  static const char* value(const ::practica_servicios::geograspResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::practica_servicios::geograspResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Pose p\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of position and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
";
  }

  static const char* value(const ::practica_servicios::geograspResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::practica_servicios::geograspResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.p);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct geograspResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::practica_servicios::geograspResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::practica_servicios::geograspResponse_<ContainerAllocator>& v)
  {
    s << indent << "p: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.p);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PRACTICA_SERVICIOS_MESSAGE_GEOGRASPRESPONSE_H