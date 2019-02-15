#!/usr/bin/env python
import rospy
from blockChainPack_.msg import nodeOnline

nodeList = ['NODE1', 'NODE2', 'NODE3']
nodeONOFF = [1,0,0]


def callback(data):
    if data.nodeName in nodeList:
        nodeONOFF[nodeList.index(data.nodeName)] = 1

def main():
    rospy.Subscriber('nodesOnline', nodeOnline, callback)
    rospy.Subscriber('fileDownload', )
    rospy.spin()

if __name__ == '__main__':
    rospy.init_node('authentication', anonymous="True")
    main()


# create all the node folders
# get all nodes to send their text files
# run a comparison script, find the average 
# if identical, blockchain isn't compromised
# if not identical, reissue node with uncompromised files


# maybe write a custom message

# what about just sending the last block hash from each blockchain, if the strings don't match, authentication fails.