#! /usr/bin/python
import socket
import sys, time, threading


def lowerCasing():
    global tcpStationName
    global tcpOrderNumber
    global tcpCarrierNumber
    global tcpProductCode
    global tcpSeconds
    global tcpMinutes
    global tcpHours
    global tcpDays
    global tcpMonths
    global tcpYears
    global dataFollowing

    # Create a TCP/IP socket
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Then bind() is used to associate the socket with the server address. In this case, the address is localhost, referring to the current server, and the port number is 10000.

    # Bind the socket to the port
    server_address = ('172.21.4.152', 4500)
    print sys.stderr, 'starting up on %s port %s' % server_address
    sock.bind(server_address)
    # Calling listen() puts the socket into server mode, and accept() waits for an incoming connection.

    # Listen for incoming connections
    sock.listen(1)

    while True:
        # Wait for a connection
        print >> sys.stderr, 'waiting for a connection'
        connection, client_address = sock.accept()
        # accept() returns an open connection between the server and client, along with the address of the client. The connection is actually a different socket on another port (assigned by the kernel). Data is read from the connection with recv() and transmitted with sendall().

        try:

            print >> sys.stderr, 'connection from', client_address

            # Receive the data in small chunks and retransmit it
            while True:
                data = connection.recv(31)

                if data:
                    dataFollowing = 0
                    # if data == '                              ':
                    #     dataFollowing = 0
                    if data != '                               ':

                        # example: 1,1230, 211,48, 6,18,21, 3,2019
                        # print data
                        try:
                            print(data)
                            tcpStationName = data[0]
                            tcpOrderNumber = int(data[2] + data[3] + data[4] + data[5])
                            tcpCarrierNumber = 0
                            tcpProductCode = int(data[8] + data[9] + data[10])
                            tcpSeconds = data[12] + data[13]
                            tcpMinutes = data[15] + data[16]
                            tcpHours = data[18] + data[19]
                            tcpDays = data[21] + data[22]
                            tcpMonths = data[24] + data[25]
                            tcpYears = data[27] + data[28] + data[29] + data[30]


                            # print data
                            # print tcpStationName + ',' + tcpOrderNumber
                        except:
                                print "lower casing fail"
                                print(data)
                                dataFollowing = 0
                    # time.sleep(1)
                else:
                    print >> sys.stderr, 'no more data from', client_address
                    dataFollowing = 0
                    break


        finally:
            # Clean up the connection
            connection.close()


if __name__ == '__main__':
    lowerCasing()