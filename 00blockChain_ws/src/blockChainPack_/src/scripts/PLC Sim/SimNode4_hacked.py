#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket


send = ''
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4502))

def main():
    counter = 1
    while(True):

        s.sendall(str(counter) + ',1296,3,211,01,54,18,19,03,2019')
        s.sendall('                                ')
        time.sleep(10)
        counter = counter + 1

        if counter == 6:
            counter = 1



if __name__ == '__main__':
    main()