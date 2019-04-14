#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket
from datetime import datetime
send = ''
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 4500))

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
    order = 1303

    send = str(station) + ',' + str(order) + ',' + str(carrier) + ',' + str(product) + ',' + str(second) + ',' + str(
        minute) + ',' + str(hour) + ',' + str(day) + ',' + str(month) + ',' + str(year)

    return send


def main():

    s.sendall(getData())
    print(getData())
    s.sendall('                                ')



if __name__ == '__main__':
    main()