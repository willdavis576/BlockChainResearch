// Generated by gencpp from file blockChainPack_/lastHash.msg
// DO NOT EDIT!


#ifndef BLOCKCHAINPACK__MESSAGE_LASTHASH_H
#define BLOCKCHAINPACK__MESSAGE_LASTHASH_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace blockChainPack_
{
template <class ContainerAllocator>
struct lastHash_
{
  typedef lastHash_<ContainerAllocator> Type;

  lastHash_()
    : nodeName()
    , hash()  {
    }
  lastHash_(const ContainerAllocator& _alloc)
    : nodeName(_alloc)
    , hash(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _nodeName_type;
  _nodeName_type nodeName;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _hash_type;
  _hash_type hash;





  typedef boost::shared_ptr< ::blockChainPack_::lastHash_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::blockChainPack_::lastHash_<ContainerAllocator> const> ConstPtr;

}; // struct lastHash_

typedef ::blockChainPack_::lastHash_<std::allocator<void> > lastHash;

typedef boost::shared_ptr< ::blockChainPack_::lastHash > lastHashPtr;
typedef boost::shared_ptr< ::blockChainPack_::lastHash const> lastHashConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::blockChainPack_::lastHash_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::blockChainPack_::lastHash_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace blockChainPack_

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
<<<<<<< HEAD
// {'blockChainPack_': ['/home/pi/blockChainGit/00blockChain_ws/src/blockChainPack_/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}
=======
<<<<<<< HEAD
// {'blockChainPack_': ['/home/pi/blockChainGit/00blockChain_ws/src/blockChainPack_/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}
=======
// {'blockChainPack_': ['/home/ros/blockChainGit/00blockChain_ws/src/blockChainPack_/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}
>>>>>>> 04495caef248ff88c82b4aada68a5c73c263b2d4
>>>>>>> 707126bdf0988d6187233f40a3e49789231d159b

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::blockChainPack_::lastHash_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::blockChainPack_::lastHash_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::blockChainPack_::lastHash_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::blockChainPack_::lastHash_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::blockChainPack_::lastHash_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::blockChainPack_::lastHash_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::blockChainPack_::lastHash_<ContainerAllocator> >
{
  static const char* value()
  {
    return "66f1a569f696850dc0629c7d1fb0b6b9";
  }

  static const char* value(const ::blockChainPack_::lastHash_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x66f1a569f696850dULL;
  static const uint64_t static_value2 = 0xc0629c7d1fb0b6b9ULL;
};

template<class ContainerAllocator>
struct DataType< ::blockChainPack_::lastHash_<ContainerAllocator> >
{
  static const char* value()
  {
    return "blockChainPack_/lastHash";
  }

  static const char* value(const ::blockChainPack_::lastHash_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::blockChainPack_::lastHash_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string nodeName\n\
string hash\n\
";
  }

  static const char* value(const ::blockChainPack_::lastHash_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::blockChainPack_::lastHash_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.nodeName);
      stream.next(m.hash);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct lastHash_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::blockChainPack_::lastHash_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::blockChainPack_::lastHash_<ContainerAllocator>& v)
  {
    s << indent << "nodeName: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.nodeName);
    s << indent << "hash: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.hash);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BLOCKCHAINPACK__MESSAGE_LASTHASH_H
