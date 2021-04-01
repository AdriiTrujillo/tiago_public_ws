// Generated by gencpp from file pal_walking_msgs/SMStatus.msg
// DO NOT EDIT!


#ifndef PAL_WALKING_MSGS_MESSAGE_SMSTATUS_H
#define PAL_WALKING_MSGS_MESSAGE_SMSTATUS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Pose.h>

namespace pal_walking_msgs
{
template <class ContainerAllocator>
struct SMStatus_
{
  typedef SMStatus_<ContainerAllocator> Type;

  SMStatus_()
    : left_foot_pose()
    , right_foot_pose()
    , stance_foot_side(0)
    , future_swing_landing_pose()
    , future_swing_side(0)  {
    }
  SMStatus_(const ContainerAllocator& _alloc)
    : left_foot_pose(_alloc)
    , right_foot_pose(_alloc)
    , stance_foot_side(0)
    , future_swing_landing_pose(_alloc)
    , future_swing_side(0)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _left_foot_pose_type;
  _left_foot_pose_type left_foot_pose;

   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _right_foot_pose_type;
  _right_foot_pose_type right_foot_pose;

   typedef uint8_t _stance_foot_side_type;
  _stance_foot_side_type stance_foot_side;

   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _future_swing_landing_pose_type;
  _future_swing_landing_pose_type future_swing_landing_pose;

   typedef uint8_t _future_swing_side_type;
  _future_swing_side_type future_swing_side;



  enum {
    right = 1u,
    left = 0u,
  };


  typedef boost::shared_ptr< ::pal_walking_msgs::SMStatus_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_walking_msgs::SMStatus_<ContainerAllocator> const> ConstPtr;

}; // struct SMStatus_

typedef ::pal_walking_msgs::SMStatus_<std::allocator<void> > SMStatus;

typedef boost::shared_ptr< ::pal_walking_msgs::SMStatus > SMStatusPtr;
typedef boost::shared_ptr< ::pal_walking_msgs::SMStatus const> SMStatusConstPtr;

// constants requiring out of line definition

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_walking_msgs::SMStatus_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_walking_msgs::SMStatus_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::pal_walking_msgs::SMStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_walking_msgs::SMStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_walking_msgs::SMStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_walking_msgs::SMStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_walking_msgs::SMStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_walking_msgs::SMStatus_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_walking_msgs::SMStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c7b8f29539d1ef0f23de0a00992a911c";
  }

  static const char* value(const ::pal_walking_msgs::SMStatus_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc7b8f29539d1ef0fULL;
  static const uint64_t static_value2 = 0x23de0a00992a911cULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_walking_msgs::SMStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_walking_msgs/SMStatus";
  }

  static const char* value(const ::pal_walking_msgs::SMStatus_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_walking_msgs::SMStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Pose left_foot_pose\n\
geometry_msgs/Pose right_foot_pose\n\
uint8 stance_foot_side\n\
\n\
geometry_msgs/Pose future_swing_landing_pose\n\
uint8 future_swing_side\n\
\n\
uint8 right=1               # right leg constant\n\
uint8 left=0                # left leg constant\n\
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

  static const char* value(const ::pal_walking_msgs::SMStatus_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_walking_msgs::SMStatus_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.left_foot_pose);
      stream.next(m.right_foot_pose);
      stream.next(m.stance_foot_side);
      stream.next(m.future_swing_landing_pose);
      stream.next(m.future_swing_side);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SMStatus_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_walking_msgs::SMStatus_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pal_walking_msgs::SMStatus_<ContainerAllocator>& v)
  {
    s << indent << "left_foot_pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.left_foot_pose);
    s << indent << "right_foot_pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.right_foot_pose);
    s << indent << "stance_foot_side: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.stance_foot_side);
    s << indent << "future_swing_landing_pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.future_swing_landing_pose);
    s << indent << "future_swing_side: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.future_swing_side);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PAL_WALKING_MSGS_MESSAGE_SMSTATUS_H