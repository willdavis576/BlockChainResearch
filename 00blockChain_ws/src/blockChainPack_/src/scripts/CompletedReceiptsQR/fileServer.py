#! /usr/bin/python
# from __future__ import print_function

import pyzbar.pyzbar as pyzbar
import numpy as np
import cv2
import time
import rospy
import http.server
import socketserver

PORT = 8000


def main():
    global PORT

    Handler = http.server.SimpleHTTPRequestHandler
    httpd = socketserver.TCPServer(("",PORT), Handler)
    print("Server at port: ", PORT)
    httpd.serve_forever()




if __name__ == '__main__':
    main()
