// Generated by gencpp from file pal_interaction_msgs/asrresult.msg
// DO NOT EDIT!


#ifndef PAL_INTERACTION_MSGS_MESSAGE_ASRRESULT_H
#define PAL_INTERACTION_MSGS_MESSAGE_ASRRESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <pal_interaction_msgs/actiontag.h>

namespace pal_interaction_msgs
{
template <class ContainerAllocator>
struct asrresult_
{
  typedef asrresult_<ContainerAllocator> Type;

  asrresult_()
    : text()
    , confidence(0)
    , start()
    , end()
    , tags()  {
    }
  asrresult_(const ContainerAllocator& _alloc)
    : text(_alloc)
    , confidence(0)
    , start()
    , end()
    , tags(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _text_type;
  _text_type text;

   typedef int8_t _confidence_type;
  _confidence_type confidence;

   typedef ros::Time _start_type;
  _start_type start;

   typedef ros::Time _end_type;
  _end_type end;

   typedef std::vector< ::pal_interaction_msgs::actiontag_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::pal_interaction_msgs::actiontag_<ContainerAllocator> >::other >  _tags_type;
  _tags_type tags;



  enum {
    CONFIDENCE_UNDEFINED = -1,
    CONFIDENCE_POOR = 1,
    CONFIDENCE_LOW = 2,
    CONFIDENCE_GOOD = 3,
    CONFIDENCE_MAX = 4,
  };


  typedef boost::shared_ptr< ::pal_interaction_msgs::asrresult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pal_interaction_msgs::asrresult_<ContainerAllocator> const> ConstPtr;

}; // struct asrresult_

typedef ::pal_interaction_msgs::asrresult_<std::allocator<void> > asrresult;

typedef boost::shared_ptr< ::pal_interaction_msgs::asrresult > asrresultPtr;
typedef boost::shared_ptr< ::pal_interaction_msgs::asrresult const> asrresultConstPtr;

// constants requiring out of line definition

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pal_interaction_msgs::asrresult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pal_interaction_msgs::asrresult_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::pal_interaction_msgs::asrresult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pal_interaction_msgs::asrresult_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_interaction_msgs::asrresult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pal_interaction_msgs::asrresult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_interaction_msgs::asrresult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pal_interaction_msgs::asrresult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pal_interaction_msgs::asrresult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a6ebae90936a20cef967166ff7e96f64";
  }

  static const char* value(const ::pal_interaction_msgs::asrresult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa6ebae90936a20ceULL;
  static const uint64_t static_value2 = 0xf967166ff7e96f64ULL;
};

template<class ContainerAllocator>
struct DataType< ::pal_interaction_msgs::asrresult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pal_interaction_msgs/asrresult";
  }

  static const char* value(const ::pal_interaction_msgs::asrresult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pal_interaction_msgs::asrresult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "## Message that containes the recognized utterance.\n\
## Confidence values\n\
int8 CONFIDENCE_UNDEFINED = -1\n\
int8 CONFIDENCE_POOR = 1\n\
int8 CONFIDENCE_LOW  = 2\n\
int8 CONFIDENCE_GOOD = 3\n\
int8 CONFIDENCE_MAX  = 4\n\
\n\
# ASR result messages used by RosRecognizerServer\n\
\n\
# text recognized\n\
string text\n\
\n\
# confidence with values from POOR to MAX\n\
int8 confidence\n\
\n\
# start and end of the recognizer uterance.\n\
time start\n\
time end\n\
\n\
# list of recognized tags\n\
# key value pairs of strings extracted from the text\n\
# given the action tags placed in the grammar.\n\
actiontag[] tags\n\
\n\
================================================================================\n\
MSG: pal_interaction_msgs/actiontag\n\
# Action tag contaings the key/value information genertated by parsing the recognised text with a JSGF grammar \n\
\n\
string key\n\
string value\n\
";
  }

  static const char* value(const ::pal_interaction_msgs::asrresult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pal_interaction_msgs::asrresult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.text);
      stream.next(m.confidence);
      stream.next(m.start);
      stream.next(m.end);
      stream.next(m.tags);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct asrresult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pal_interaction_msgs::asrresult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pal_interaction_msgs::asrresult_<ContainerAllocator>& v)
  {
    s << indent << "text: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.text);
    s << indent << "confidence: ";
    Printer<int8_t>::stream(s, indent + "  ", v.confidence);
    s << indent << "start: ";
    Printer<ros::Time>::stream(s, indent + "  ", v.start);
    s << indent << "end: ";
    Printer<ros::Time>::stream(s, indent + "  ", v.end);
    s << indent << "tags[]" << std::endl;
    for (size_t i = 0; i < v.tags.size(); ++i)
    {
      s << indent << "  tags[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::pal_interaction_msgs::actiontag_<ContainerAllocator> >::stream(s, indent + "    ", v.tags[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // PAL_INTERACTION_MSGS_MESSAGE_ASRRESULT_H
