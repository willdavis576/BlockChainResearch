#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket


send = ''

def main():
    global send
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('172.21.4.152', 4505))
    while(True):

        s.sendall(send)
        time.sleep(1)


def timer():
    global send
    send = '1,1226,0211,01,54,18,19,03,2019'
    time.sleep(1)
    send = '                              '
    time.sleep(1)


if __name__ == '__main__':
    p1 = threading.Thread(target=main, args=())
    p2 = threading.Thread(target=timer, args=())

    p1.start()
    p2.start()

    p1.join()
    p2.join()