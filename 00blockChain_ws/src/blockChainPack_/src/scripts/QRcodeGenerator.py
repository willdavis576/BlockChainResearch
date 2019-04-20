#! /usr/bin/python
# from __future__ import print_function

import pyzbar.pyzbar as pyzbar
import numpy as np
import cv2
import time
import rospy
import pyqrcode
import http.server
import socketserver

PORT = 8000
address = "172.20.10.7"


def main():
    pr = pyqrcode.create("http://" + address + ":" + str(PORT) + "/Receipts/MES_NODE2/Product1275C%3A1Comp0.txt")
    pr.png("httpQR.png", scale=6)



if __name__ == '__main__':
    main()
