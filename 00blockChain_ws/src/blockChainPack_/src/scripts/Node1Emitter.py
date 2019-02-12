#! /usr/bin/python
import rospy,time
from blockChainPack_.msg import nodeOnline

def main():
    while not rospy.is_shutdown():
        nodeUp = rospy.Publisher('nodesOnline', nodeOnline, queue_size=1)
        message2 = nodeOnline()
        message2.nodeName = "NODE1"
        nodeUp.publish(message2)
        time.sleep(1)



if __name__ == '__main__':
    rospy.init_node('NameCall', anonymous="True")
    main()
