#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket


send = '                                '
var = "n"
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('192.168.0.51', 4501))

def main():
    global var
    global send
    while(True):
        if var == "y":
            s.sendall(send)

            send = '                                '
            var = "n"

def select():
    global send
    global var
    while(True):
        var = raw_input("Send?")

        if var == "y":
            send = '2,1296,0211,01,54,18,19,03,2019'

        if var == "n":
            send = '                                '







if __name__ == '__main__':
    p1 = threading.Thread(target=main, args=())
    p2 = threading.Thread(target=select, args=())

    p1.start()
    p2.start()

    p1.join()
    p2.join()