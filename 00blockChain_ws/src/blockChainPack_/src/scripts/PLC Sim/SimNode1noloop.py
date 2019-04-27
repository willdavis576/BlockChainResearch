#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket
from datetime import datetime
send = ''
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
<<<<<<< HEAD
s.connect(('127.0.0.1', 4500))
=======
s.connect(('127.0.0.1', 4505))
>>>>>>> 04495caef248ff88c82b4aada68a5c73c263b2d4

var = ''

def getData():

    dateTime = str(datetime.now())
    year = dateTime[0] + dateTime[1] + dateTime[2] + dateTime[3]
    month = dateTime[5] + dateTime[6]
    day = dateTime[8] + dateTime[9]
    hour = dateTime[11] + dateTime[12]
    minute = dateTime[14] + dateTime[15]
    second = dateTime[17] + dateTime[18]
    product = 211
    station = 1
    carrier = 2
    order = 1304

    send = str(station) + ',' + str(order) + ',' + str(carrier) + ',' + str(product) + ',' + str(second) + ',' + str(
<<<<<<< HEAD
        minute) + ',' + str(hour) + ',' + str(day) + ',' + str(month) + ',' + str(year)
=======
        minute) + ',' + str(hour) + ',' + str(day) + ',' + str(month) + ',' + str(year) + ',' + str(371) + ',' + str(335)
>>>>>>> 04495caef248ff88c82b4aada68a5c73c263b2d4

    return send


def main():
    global var
    while (True):
        if var == '':
<<<<<<< HEAD
            s.sendall('                                ')
=======
            s.sendall('                                        ')
            time.sleep(1)
>>>>>>> 04495caef248ff88c82b4aada68a5c73c263b2d4


def user():
    global var
    var = raw_input("now?")

    while (True):
        if var == "y":
            s.sendall(getData())
<<<<<<< HEAD
            s.sendall('                                ')
            var == ''
=======
            s.sendall('                                        ')
            var = ''

>>>>>>> 04495caef248ff88c82b4aada68a5c73c263b2d4


if __name__ == '__main__':
    p1 = threading.Thread(target=main, args=())
    p2 = threading.Thread(target=user, args=())

    p1.start()
    p2.start()

    p1.join()
    p2.join()