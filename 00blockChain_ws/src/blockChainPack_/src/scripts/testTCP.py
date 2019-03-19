#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket




def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('172.21.4.152', 4500))
    #s.sendall('444;#RequestID=0;MClass=101;MNo=2;ErrorState=0;#PNo=212;#Aux1Int=1\r')
    s.sendall('small\r')

    s.close()





if __name__ == '__main__':
    main()