#!/usr/bin/env python
import rospy
from blockChainPack_.msg import blockDetail

def callback(data):
    rospy.loginfo('I heard %s', ("Time Stamp for Block " + data.timeStamp, data.transactions, "Serial Number " + data.serialNumber, "Current blockhash: " + data.blockHash, "Previous blockhash: " + data.previousHash))

def listener():

    rospy.init_node('listener', anonymous=False)

    rospy.Subscriber('publishingBlockStream', blockDetail, callback)
  

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
