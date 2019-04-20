#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket
from blockChainPack_.msg import sim
send = ''
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4501))
recData = '                                '

def main():
    global recData
    rospy.Subscriber('sim', sim, callback)
    print("start")
    while not rospy.is_shutdown():
        s.sendall('                                ')
        # for i in range(4):
        #     s.sendall('1' + ',1296,' + str(i + 1) + ',211,01,54,18,19,03,2019')
        #     print(str('1') + ',1296,' + str(i + 1) + ',211,01,54,18,19,03,2019')
        #     s.sendall('                                ')
        #     time.sleep(15)

        if recData != '                                ':
            if recData[0] == '2':
                print("data")
                s.sendall(recData)
                print(recData)
                recData = '                                '


        time.sleep(0.1)


def callback(data):
    global recData
    print("data rec")
    recData = data.data
    # time.sleep(0.1)
    # recData = '                                '



if __name__ == '__main__':
    rospy.init_node('simStation1', anonymous="True")
    main()