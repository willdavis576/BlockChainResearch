#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket




def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('172.21.0.90', 2000))
    s.sendall('444;#RequestID=0;MClass=101;MNo=2;ErrorState=0;#PNo=211;#Aux1Int=1\r')
    data = s.recv(1024)
    s.close()
    print(data)


if __name__ == '__main__':
    main()
