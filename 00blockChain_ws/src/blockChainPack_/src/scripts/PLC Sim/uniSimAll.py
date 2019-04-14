#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket
from datetime import datetime


# 2019-04-14 21:36:49.647046

# 1,1296,1,211,01,54,18,19,03,2019
# 1,1300,0,0,211,48,51,21,14,04,2019

carrier = 1
order = 1303

def getData(station, carrier, order):

    dateTime = str(datetime.now())
    year = dateTime[0] + dateTime[1] + dateTime[2] + dateTime[3]
    month = dateTime[5] + dateTime[6]
    day = dateTime[8] + dateTime[9]
    hour = dateTime[11] + dateTime[12]
    minute = dateTime[14] + dateTime[15]
    second = dateTime[17] + dateTime[18]
    product = 211
    station = 1
    carrier = 1
    order = 1301

    send = str(station) + ',' + str(order) + ',' + str(carrier) + ',' + str(product) + ',' + str(second) + ',' + str(
        minute) + ',' + str(hour) + ',' + str(day) + ',' + str(month) + ',' + str(year)

    return send


def main():

    global carrier
    global order

    case = 0

    while(True):
        if case == 0:
            station = 1
            send = getData(station, carrier, order)
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.connect(('127.0.0.1', 4500))
            time.sleep(0.1)
            s.sendall(send)
            s.sendall('                                ')
            print('1')
            time.sleep(2)
            case = case + 1


        if case == 1:
            station = 2
            carrier = 1
            order = 1301
            send = getData(station, carrier, order)
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.connect(('127.0.0.1', 4501))
            time.sleep(0.1)
            s.sendall('                                ')
            s.sendall(send)
            s.sendall('                                ')
            print('2')
            time.sleep(2)
            case = case + 1

        if case == 2:
            station = 3
            carrier = 1
            order = 1301
            send = getData(station, carrier, order)
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.connect(('127.0.0.1', 4502))
            time.sleep(0.1)
            s.sendall('                                ')
            s.sendall(send)
            s.sendall('                                ')
            print('3')
            time.sleep(2)
            case = case + 1

        if case == 3:
            break


if __name__ == '__main__':
    main()