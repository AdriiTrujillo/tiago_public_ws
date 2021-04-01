// Generated by gencpp from file pal_statistics_msgs/StatisticsNames.msg
// DO NOT EDIT!


#ifndef PAL_STATISTICS_MSGS_MESSAGE_STATISTICSNAMES_H
#define PAL_STATISTICS_MSGS_MESSAGE_STATISTICSNAMES_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace pal_statistics_msgs
{
template <class ContainerAllocator>
struct StatisticsNames_
{
  typedef StatisticsNames_<ContainerAllocator> Type;

  StatisticsNames_()
    : header()
    , names()
    , names_version(0)  {
    }
  StatisticsNames_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , names(_alloc)
    , names_version(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _names_type;
  _names_type names;

   typedef uint32_t _names_version_type;
  _names_version_type names_version;





  typedef boost::shared_ptr< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> const> ConstPtr;

}; // struct StatisticsNames_

typedef ::pal_statistics_msgs::StatisticsNames_<std::allocator<void> > StatisticsNames;

typedef boost::shared_ptr< ::pal_statistics_msgs::StatisticsNames > StatisticsNamesPtr;
typedef boost::shared_ptr< ::pal_statistics_msgs::StatisticsNames const> StatisticsNamesConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pal_statistics_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'pal_statistics_msgs': ['/home/adrii/tiago_public_ws/src/pal_statistics/pal_statistics_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bece3d42a81d5c50cd68f110cf17bf55";
  }

  static const char* value(const ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbece3d42a81d5c50ULL;
  static const uint64_t static_value2 = 0xcd68f110cf17bf55ULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_statistics_msgs/StatisticsNames";
  }

  static const char* value(const ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# header\n\
Header header\n\
\n\
# Statistics names\n\
string[] names\n\
uint32 names_version #This is increased each time names change\n\
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
";
  }

  static const char* value(const ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.names);
      stream.next(m.names_version);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct StatisticsNames_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pal_statistics_msgs::StatisticsNames_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "names[]" << std::endl;
    for (size_t i = 0; i < v.names.size(); ++i)
    {
      s << indent << "  names[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.names[i]);
    }
    s << indent << "names_version: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.names_version);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PAL_STATISTICS_MSGS_MESSAGE_STATISTICSNAMES_H