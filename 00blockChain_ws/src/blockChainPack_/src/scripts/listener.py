#!/usr/bin/env python
import rospy
from blockChainPack_.msg import blockDetail

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', (data.blockNumber, data.productNumber))

def listener():

    rospy.init_node('listener', anonymous=False)

    rospy.Subscriber('publishingBlockStream', blockDetail, callback)
  

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
