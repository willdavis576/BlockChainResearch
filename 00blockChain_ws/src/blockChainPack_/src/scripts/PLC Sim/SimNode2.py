#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket


send = ''
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('192.168.79.128', 4501))

def main():
    while(True):

        s.sendall('2,1296,0211,01,54,18,19,03,2019')
        s.sendall('                               ')
        time.sleep(10)





if __name__ == '__main__':
    main()