#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket




def main():

        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.connect(('172.21.0.90', 2000))
        sock.sendall('444;#RequestID=0;MClass=101;MNo=2;ErrorState=0;#PNo=211;#Aux1Int=1;\r')
        data = sock.recv(1024)
        sock.close()
        print(data)


if __name__ == '__main__':
    main()



# THIS IS THE KEY => b4718ea7acc2e60199286959bffb58a78bb123ad6eece513123f7fc3b65149f5
