#! /usr/bin/python3
# from __future__ import print_function


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
