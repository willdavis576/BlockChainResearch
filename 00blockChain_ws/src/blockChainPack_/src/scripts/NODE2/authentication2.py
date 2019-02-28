#!/usr/bin/env python
import rospy
from blockChainPack_.msg import nodeOnline

nodeList = ['NODE1', 'NODE2', 'NODE3']
nodeONOFF = [0,1,0]


def callback(data):
    if data.nodeName in nodeList:
        nodeONOFF[nodeList.index(data.nodeName)] = 1
    print(nodeONOFF)

def main():
    rospy.Subscriber('nodesOnline', nodeOnline, callback)
    #rospy.Subscriber('fileDownload', )
    rospy.spin()

if __name__ == '__main__':
    rospy.init_node('authentication', anonymous="True")
    main()
