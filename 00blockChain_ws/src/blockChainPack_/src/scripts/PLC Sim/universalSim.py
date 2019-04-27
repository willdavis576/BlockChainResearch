#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket

send = ''
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4500))


def main():

    while (True):

        for i in range(3):
            for j in range(4):
                s.sendall(str(i + 1) + ',1296,' + str(j + 1) + ',211,01,54,18,19,03,2019')
                print(str(i + 1) + ',1296,' + str(j + 1) + ',211,01,54,18,19,03,2019')
                s.sendall('                                ')
                time.sleep(2.5)


if __name__ == '__main__':
    main()
