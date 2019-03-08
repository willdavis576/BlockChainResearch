// Generated by gencpp from file blockChainPack_/rewriteNode.msg
// DO NOT EDIT!


#ifndef BLOCKCHAINPACK__MESSAGE_REWRITENODE_H
#define BLOCKCHAINPACK__MESSAGE_REWRITENODE_H


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
struct rewriteNode_
{
  typedef rewriteNode_<ContainerAllocator> Type;

  rewriteNode_()
    : left(0)
    , right(0)
    , element()  {
    }
  rewriteNode_(const ContainerAllocator& _alloc)
    : left(0)
    , right(0)
    , element(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _left_type;
  _left_type left;

   typedef int32_t _right_type;
  _right_type right;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _element_type;
  _element_type element;





  typedef boost::shared_ptr< ::blockChainPack_::rewriteNode_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::blockChainPack_::rewriteNode_<ContainerAllocator> const> ConstPtr;

}; // struct rewriteNode_

typedef ::blockChainPack_::rewriteNode_<std::allocator<void> > rewriteNode;

typedef boost::shared_ptr< ::blockChainPack_::rewriteNode > rewriteNodePtr;
typedef boost::shared_ptr< ::blockChainPack_::rewriteNode const> rewriteNodeConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::blockChainPack_::rewriteNode_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::blockChainPack_::rewriteNode_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace blockChainPack_

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'blockChainPack_': ['/home/ros/blockChainGit/00blockChain_ws/src/blockChainPack_/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::blockChainPack_::rewriteNode_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::blockChainPack_::rewriteNode_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::blockChainPack_::rewriteNode_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::blockChainPack_::rewriteNode_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::blockChainPack_::rewriteNode_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::blockChainPack_::rewriteNode_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::blockChainPack_::rewriteNode_<ContainerAllocator> >
{
  static const char* value()
  {
    return "de7b9a4f559650249dc7ff7249ac243f";
  }

  static const char* value(const ::blockChainPack_::rewriteNode_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xde7b9a4f55965024ULL;
  static const uint64_t static_value2 = 0x9dc7ff7249ac243fULL;
};

template<class ContainerAllocator>
struct DataType< ::blockChainPack_::rewriteNode_<ContainerAllocator> >
{
  static const char* value()
  {
    return "blockChainPack_/rewriteNode";
  }

  static const char* value(const ::blockChainPack_::rewriteNode_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::blockChainPack_::rewriteNode_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 left\n\
int32 right\n\
string element\n\
";
  }

  static const char* value(const ::blockChainPack_::rewriteNode_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::blockChainPack_::rewriteNode_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.left);
      stream.next(m.right);
      stream.next(m.element);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct rewriteNode_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::blockChainPack_::rewriteNode_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::blockChainPack_::rewriteNode_<ContainerAllocator>& v)
  {
    s << indent << "left: ";
    Printer<int32_t>::stream(s, indent + "  ", v.left);
    s << indent << "right: ";
    Printer<int32_t>::stream(s, indent + "  ", v.right);
    s << indent << "element: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.element);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BLOCKCHAINPACK__MESSAGE_REWRITENODE_H
