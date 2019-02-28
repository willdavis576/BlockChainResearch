#! /usr/bin/python
import rospy,time
from blockChainPack_.msg import nodeOnline
from blockChainPack_.msg import blockDetail

def main():
    while not rospy.is_shutdown():
        nodeUp = rospy.Publisher('nodesOnline', nodeOnline, queue_size=1)
        #productNumber = rospy.Subscriber('publishingBlockStream', blockDetail, fileSend)
        message2 = nodeOnline()
        message2.nodeName = "NODE1"
        nodeUp.publish(message2)
        time.sleep(1)

#def fileSend(data):
    # productNumber = data.productNumber
    # fh = open("/home/ros/blockChainGit/00blockChain_ws/blockChain/blockChain[" + str(data.productNumber) + "].txt", 'r')
    # readfile = fh.read()



if __name__ == '__main__':
    rospy.init_node('NameCall', anonymous="True")
    main()
