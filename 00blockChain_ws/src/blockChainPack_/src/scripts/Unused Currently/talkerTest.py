#!/usr/bin/env python
import rospy
from std_msgs.msg import String

def main():
    while not rospy.is_shutdown():
        pub = rospy.Publisher('talkerTest1', String, queue_size=1)
        pub.publish("1")
        # print("talking")

if __name__ == '__main__':
    rospy.init_node('talker')
    main()