#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket
from datetime import datetime
from collections import Counter
from blockChainPack_.msg import rewriteNode
Range = 200
cRange = 4
timestamp = [[['a' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

def main():
    rospy.Subscriber('Rewrite', rewriteNode, callback)
    rospy.spin()

def callback(data):
    global timestamp

    timestamp[data.firstIndex][data.secondIndex][data.thirdIndex] = data.SblockTimeStamp


if __name__ == '__main__':
    rospy.init_node('testRewrite', anonymous="True")
    rate = rospy.Rate(10)
    main()