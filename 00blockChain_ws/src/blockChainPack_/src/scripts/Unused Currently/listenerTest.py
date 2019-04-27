#!/usr/bin/env python
import rospy, time
from std_msgs.msg import String

def callback(data):
    print(data)
    time.sleep(1)

def callback2(data):
    print(data)
    time.sleep(1)

def main():
    rospy.Subscriber('talkerTest1', String, callback)
    rospy.Subscriber('talkerTest2', String, callback2)

    rospy.spin()

if __name__ == '__main__':
    rospy.init_node('listener')
    main()