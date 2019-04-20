#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket, os
from datetime import datetime
from collections import Counter
from blockChainPack_.msg import sim


def main():
    pub = rospy.Publisher('sim', sim, queue_size=100)

    while not rospy.is_shutdown():
        var = raw_input("Station, order, carrier, product")
        dateTime = str(datetime.now())
        year = dateTime[0] + dateTime[1] + dateTime[2] + dateTime[3]
        month = dateTime[5] + dateTime[6]
        day = dateTime[8] + dateTime[9]
        hour = dateTime[11] + dateTime[12]
        minute = dateTime[14] + dateTime[15]
        second = dateTime[17] + dateTime[18]

        station = var[0]
        order = var[2] + var[3] + var[4] + var[5]
        carrier = var[7]
        product = var[9] + var[10] + var[11]

        # '1,1301,2,211,26,12,16,19,04,2019'

        data_to_print = str(station) + ',' + str(order) + ',' + str(carrier) + ',' + str(product) + ',' + str(second) + ',' + str(
            minute) + ',' + str(hour) + ',' + str(day) + ',' + str(month) + ',' + str(year)

        message = sim()
        message.data = data_to_print
        pub.publish(message)

if __name__ == '__main__':
    rospy.init_node('masterSim', anonymous="True")
    main()
