<<<<<<< HEAD
=======
<<<<<<< HEAD
#! /usr/bin/python3
# from __future__ import print_function


=======
>>>>>>> 707126bdf0988d6187233f40a3e49789231d159b
#! /usr/bin/python
# from __future__ import print_function

import pyzbar.pyzbar as pyzbar
import numpy as np
import cv2
import time
import rospy
<<<<<<< HEAD
=======
>>>>>>> 04495caef248ff88c82b4aada68a5c73c263b2d4
>>>>>>> 707126bdf0988d6187233f40a3e49789231d159b
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
