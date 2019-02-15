#!/usr/bin/env python
import rospy
from blockChainPack_.msg import nodeOnline

nodeList = ['NODE1', 'NODE2', 'NODE3']
nodeONOFF = [0,0,0]


def callback(data):
    if data.nodeName in nodeList:
        nodeONOFF[nodeList.index(data.nodeName)] = 1

def main():
    rospy.Subscriber('nodesOnline', nodeOnline, callback)

if __name__ == '__main__':
    rospy.init_node('authentication', anonymous="True")
    main()


# create all the node folders
# get all nodes to send their text files
# run a comparison script, find the average 
# if identical, blockchain isn't compromised
# if not identical, reissue node with uncompromised files