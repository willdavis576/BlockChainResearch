#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket
from random import randint
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4500))

for i in range(4):
    s.sendall('1' + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    print(str('1') + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    for i in range (randint(10,15)):
        s.sendall('                                        ')
        time.sleep(0.1)
s.close()

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4501))

for i in range(4):
    s.sendall('2' + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    print(str('2') + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    for i in range(randint(10, 15)):
        s.sendall('                                        ')
        time.sleep(0.1)
s.close()

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4502))

for i in range(4):
    s.sendall('3' + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    print(str('3') + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    for i in range(randint(10, 15)):
        s.sendall('                                        ')
        time.sleep(0.1)
s.close()


s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4503))

for i in range(4):
    s.sendall('4' + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    print(str('4') + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    for i in range(randint(10, 15)):
        s.sendall('                                        ')
        time.sleep(0.1)
s.close()

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4504))

for i in range(4):
    s.sendall('5' + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    print(str('5') + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    for i in range(randint(10, 15)):
        s.sendall('                                        ')
        time.sleep(0.1)
s.close()

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4505))

for i in range(4):
    s.sendall('6' + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    print(str('6') + ',1297,' + str(i + 1) + ',211,01,54,18,19,03,2019,000,000')
    for i in range(randint(10, 15)):
        s.sendall('                                        ')
        time.sleep(0.1)
s.close()