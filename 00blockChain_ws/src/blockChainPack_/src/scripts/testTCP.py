#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket


send = ''

def main():
    global send
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('192.168.79.128', 4500))
    while(True):

        s.sendall(send)


def timer():
    global send
    send = '1,1226,211,01,54,18,19,03,2019\r'
    time.sleep(0.001)
    send = '                              '
    time.sleep(1)


if __name__ == '__main__':
    p1 = threading.Thread(target=main, args=())
    p2 = threading.Thread(target=timer, args=())

    p1.start()
    p2.start()

    p1.join()
    p2.join()