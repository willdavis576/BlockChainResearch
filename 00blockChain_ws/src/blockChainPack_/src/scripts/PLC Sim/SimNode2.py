#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket

send = ''
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4501))
recData = '                                '

def main():
    global recData


    for i in range(4):
        s.sendall('2' + ',1296,' + str(i + 1) + ',211,01,54,18,19,03,2019')
        print(str('2') + ',1296,' + str(i + 1) + ',211,01,54,18,19,03,2019')
        s.sendall('                                ')
        time.sleep(1)





    # time.sleep(0.1)
    # recData = '                                '



if __name__ == '__main__':
    rospy.init_node('simStation1', anonymous="True")
    main()