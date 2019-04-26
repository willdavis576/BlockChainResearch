#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time
from std_msgs.msg import String
from blockChainPack_.msg import stringMultiarray
import numpy


def main():
    blocks = [['' for _ in range(10)] for _ in range(10)]
    blocks[0][0] = "hello"
    #["sdfsdf","sdfsdf","sdfdsf","sdsdf"]
    pub = rospy.Publisher('testingtopic', stringMultiarray, queue_size=100)
    while not rospy.is_shutdown():
        while(True):
            message = stringMultiarray()
            for i in range(0,10): #productNumber
                message.prodNum = i
                message.blocks = blocks[i]
                pub.publish(message)
                # print(blocks)
                time.sleep(1)



if __name__ == '__main__':
    rospy.init_node('testing', anonymous="True")
    main()