#!/usr/bin/env python

import rospy

def authenticate():
    pub = rospy.Publisher('authentication', String, queue_size=10)
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        hello_str = "hello world %s" % rospy.get_time()
        rospy.loginfo(hello_str) #show on terminal
        pub.publish(hello_str) #publish to publisher
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
