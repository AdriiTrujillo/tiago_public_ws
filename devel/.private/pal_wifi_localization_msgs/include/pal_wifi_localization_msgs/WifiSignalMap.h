// Generated by gencpp from file pal_wifi_localization_msgs/WifiSignalMap.msg
// DO NOT EDIT!


#ifndef PAL_WIFI_LOCALIZATION_MSGS_MESSAGE_WIFISIGNALMAP_H
#define PAL_WIFI_LOCALIZATION_MSGS_MESSAGE_WIFISIGNALMAP_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <nav_msgs/MapMetaData.h>
#include <pal_wifi_localization_msgs/WifiSignalList.h>

namespace pal_wifi_localization_msgs
{
template <class ContainerAllocator>
struct WifiSignalMap_
{
  typedef WifiSignalMap_<ContainerAllocator> Type;

  WifiSignalMap_()
    : header()
    , info()
    , sectors(0)
    , data()  {
    }
  WifiSignalMap_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , info(_alloc)
    , sectors(0)
    , data(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::nav_msgs::MapMetaData_<ContainerAllocator>  _info_type;
  _info_type info;

   typedef uint32_t _sectors_type;
  _sectors_type sectors;

   typedef std::vector< ::pal_wifi_localization_msgs::WifiSignalList_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::pal_wifi_localization_msgs::WifiSignalList_<ContainerAllocator> >::other >  _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> const> ConstPtr;

}; // struct WifiSignalMap_

typedef ::pal_wifi_localization_msgs::WifiSignalMap_<std::allocator<void> > WifiSignalMap;

typedef boost::shared_ptr< ::pal_wifi_localization_msgs::WifiSignalMap > WifiSignalMapPtr;
typedef boost::shared_ptr< ::pal_wifi_localization_msgs::WifiSignalMap const> WifiSignalMapConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pal_wifi_localization_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'pal_wifi_localization_msgs': ['/home/adrii/tiago_public_ws/src/pal_msgs/pal_wifi_localization_msgs/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5083f884f6a479bea709736f39c4131f";
  }

  static const char* value(const ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5083f884f6a479beULL;
  static const uint64_t static_value2 = 0xa709736f39c4131fULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_wifi_localization_msgs/WifiSignalMap";
  }

  static const char* value(const ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# This represents a 2-D grid map, in which each cell represents the signal strenght models of detected wifi networks.\n\
\n\
Header header \n\
\n\
#MetaData for the map\n\
nav_msgs/MapMetaData info\n\
\n\
# Define the number of sectors to be used on wifi maps that include orientation info.\n\
uint32 sectors\n\
\n\
# The map data, in row-major order, starting with (0,0).  Wifi signal strenght models\n\
# are gaussian probability distribution functions defined by mean and standard deviation value.\n\
WifiSignalList[] data\n\
\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: nav_msgs/MapMetaData\n\
# This hold basic information about the characterists of the OccupancyGrid\n\
\n\
# The time at which the map was loaded\n\
time map_load_time\n\
# The map resolution [m/cell]\n\
float32 resolution\n\
# Map width [cells]\n\
uint32 width\n\
# Map height [cells]\n\
uint32 height\n\
# The origin of the map [m, m, rad].  This is the real-world pose of the\n\
# cell (0,0) in the map.\n\
geometry_msgs/Pose origin\n\
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
\n\
================================================================================\n\
MSG: pal_wifi_localization_msgs/WifiSignalList\n\
#list of wifi signal models learnt in a specific place\n\
\n\
WifiSignal[] networks\n\
\n\
time start_time\n\
time end_time\n\
\n\
================================================================================\n\
MSG: pal_wifi_localization_msgs/WifiSignal\n\
## Contains data relative to the learnt model of a wifi signal strenght in a specific location\n\
\n\
# network id\n\
std_msgs/String id\n\
\n\
#Signal is represented through  a gaussian pdf.\n\
#The signal strenght is measured in dB\n\
\n\
float32  mean\n\
float32  std_dev\n\
\n\
\n\
\n\
================================================================================\n\
MSG: std_msgs/String\n\
string data\n\
";
  }

  static const char* value(const ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.info);
      stream.next(m.sectors);
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct WifiSignalMap_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pal_wifi_localization_msgs::WifiSignalMap_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "info: ";
    s << std::endl;
    Printer< ::nav_msgs::MapMetaData_<ContainerAllocator> >::stream(s, indent + "  ", v.info);
    s << indent << "sectors: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.sectors);
    s << indent << "data[]" << std::endl;
    for (size_t i = 0; i < v.data.size(); ++i)
    {
      s << indent << "  data[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::pal_wifi_localization_msgs::WifiSignalList_<ContainerAllocator> >::stream(s, indent + "    ", v.data[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // PAL_WIFI_LOCALIZATION_MSGS_MESSAGE_WIFISIGNALMAP_H
