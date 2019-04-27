#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket




def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('172.21.0.90', 2000))
<<<<<<< HEAD
    s.sendall('444;#RequestID=0;MClass=101;MNo=2;ErrorState=0;#PNo=212;#Aux1Int=1\r')
=======
<<<<<<< HEAD
    s.sendall('444;#RequestID=0;MClass=101;MNo=2;ErrorState=0;#PNo=212;#Aux1Int=1\r')
=======
    s.sendall('444;#RequestID=0;MClass=101;MNo=2;ErrorState=0;#PNo=211;#Aux1Int=1\r')
>>>>>>> 04495caef248ff88c82b4aada68a5c73c263b2d4
>>>>>>> 707126bdf0988d6187233f40a3e49789231d159b
    data = s.recv(1024)
    s.close()
    print(data)


if __name__ == '__main__':
<<<<<<< HEAD
    main()
=======
<<<<<<< HEAD
    main()
=======
    main()
>>>>>>> 04495caef248ff88c82b4aada68a5c73c263b2d4
>>>>>>> 707126bdf0988d6187233f40a3e49789231d159b
