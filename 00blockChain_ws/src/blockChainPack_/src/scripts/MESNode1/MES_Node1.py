#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket
from datetime import datetime
from collections import Counter
from blockChainPack_.msg import blockDetail
from blockChainPack_.msg import lastHash
from blockChainPack_.msg import rewriteNode

# station, orderNumber, productCode, seconds, minutes, hours, days, months, years
#productNubmer should now orderNumber

itemNumber = 0
dataFollowing = 0
orderNumber = 0
station = [['' for _ in range(100)] for _ in range(100)]
productCode = [''] * 100
block = [['' for _ in range(2000)] for _ in range(2000)]
blockNumber = 0

serialNumberNum = 0
serialNumberStr = 'PRODUCT'
oldinfo = ''
counter = 0
newGenesis = 1
repeat = 0
newProduct = ''
message = ''
nodeUp = ''
init = 0
noGen = 0
runYet = [''] * 100
Trigger = False
nodeList = ['NODE1', 'NODE2', 'NODE3',
            'NODE4']  ################# IF INCLUDING MORE NODES, EXTEND THIS ARRAY SIZE #######################
nodeONOFF = [1, 0, 0, 0]  ################# IF INCLUDING MORE NODES, EXTEND THIS ARRAY SIZE #######################
oldNodeONOFF = [0, 0, 0, 0]  ################# IF INCLUDING MORE NODES, EXTEND THIS ARRAY SIZE #######################
node = [['' for _ in range(100)] for _ in range(100)]
counter1 = 0;

Range = 10
SblockTimeStamp = [['' for _ in range(Range)] for _ in range(Range)]
SblockTrans = [['' for _ in range(Range)] for _ in range(Range)]
SblockProductCode = [['' for _ in range(Range)] for _ in range(Range)]
SblockHash = [['' for _ in range(Range)] for _ in range(Range)]
SblockPreviousHash = [['' for _ in range(Range)] for _ in range(Range)]
SblockNumber = [['' for _ in range(Range)] for _ in range(Range)]
SOrderNumber = [['' for _ in range(Range)] for _ in range(Range)]
Sblock = ''
authOrderNumber = 0
blockString = ''
nodeName = "NODE1"  ############### THIS IS WHERE YOU SPECIFY A NODE'S NAME #######################

# TCP SERVER STUFF
tcpStationName = 0
tcpOrderNumber = 0
tcpCarrierNumber = 0
tcpProductCode = 0
tcpSeconds = 0
tcpMinutes = 0
tcpHours = 0
tcpDays = 0
tcpMonths = 0
tcpYears = 0

# Class
seconds = 0
minutes = 0
hours = 0
days = 0
months = 0
years = 0


class blockChain:

    def __init__(self, previousHash, station, productCode, orderNumber, seconds, minutes, hours, days, months, years):
        self.timeStamp = hours + ':' + minutes + ':' + seconds + ' - ' + days + '/' + months + '/' + years
        self.productCode = productCode
        self.orderNumber = orderNumber
        self.previousHash = previousHash
        self.station = station
        self.contains = hashlib.sha256(self.station.encode()).hexdigest() + previousHash + str(
            self.timeStamp) + str(self.productCode) + str(self.orderNumber)
        self.blockHash = hashlib.sha256(self.contains.encode()).hexdigest()

    def getTimeStamp(self):
        return self.timeStamp

    def getBlockHash(self):
        return self.blockHash

    def getPreviousHash(self):
        return self.previousHash

    def getStation(self):
        return self.station

    def getProductCode(self):
        return self.productCode

    def getOrderNumber(self):
        return self.orderNumber


def blockUpdate(blockNumber, orderNumber, station, productCode,seconds, minutes, hours, days, months, years):
    for i in range(blockNumber, blockNumber + 1):
        blockNumber = i
        block[orderNumber][blockNumber] = blockChain(
            previousHash=block[orderNumber][blockNumber - 1].getBlockHash(), station=station,
            productCode=productCode, orderNumber=orderNumber, seconds=seconds, minutes=minutes,
            hours=hours, days= days, months=months, years=years)
        print(block[orderNumber][blockNumber].getBlockHash())


def sendMessage():
    global message
    message = blockDetail()
    message.blockNumber = blockNumber

    message.timeStamp = str(block[orderNumber][blockNumber].getTimeStamp())
    message.station = str(block[orderNumber][blockNumber].getStation())
    message.orderNumber = str(block[orderNumber][blockNumber].getOrderNumber())
    message.productCode = block[orderNumber][blockNumber].getproductCode()
    message.blockHash = block[orderNumber][blockNumber].getBlockHash()
    message.previousHash = block[orderNumber][blockNumber].getPreviousHash()


def main():
    while (True):
        while not rospy.is_shutdown():
            while (newProduct != "n"):
                mainProg()
        if rospy.is_shutdown():
            break


def mainProg():
    global blockNumber
    global orderNumber
    global productCodeNum
    global productCodeStr
    global oldinfo
    global counter
    global newGenesis
    global repeat
    global newProduct
    global message
    global nodeName
    global nodeUp
    global itemNumber

    pub = rospy.Publisher('publishingBlockStream', blockDetail, queue_size=100)

    while (newGenesis == 1):
        # Setup for genesis block
        repeat = 0

        # Genesis Block
        block[orderNumber][blockNumber] = blockChain(previousHash='', station="Start production",
                                          productCode='N/A',
                                                       seconds=str(datetime.now())[17:19],
                                                       minutes=str(datetime.now())[14:16],
                                                       hours=str(datetime.now())[11:13], days=str(datetime.now())[8:10],
                                                       months=str(datetime.now())[5:7], years=str(datetime.now())[0:4])
        print("genesis: ")
        print(block[orderNumber][blockNumber].getBlockHash())
        time.sleep(1)
        sendMessage()
        pub.publish(message)
        newGenesis = 0
        blockNumber = blockNumber + 1  # key part, as each station uploads information, this variable is incremented to generate a new block
        break

    while (True):
            if dataFollowing == 1:
                block[orderNumber][blockNumber]



    if repeat == 1:
        orderNumber = orderNumber + 1


def listener():
    rospy.Subscriber('publishingBlockStream', blockDetail, callback)
    rospy.spin()


def callback(data):
    global runYet
    global counter1

    global SblockTimeStamp
    global SblockTrans
    global SblockProductCode
    global SblockHash
    global SblockPreviousHash

    global SblockNumber
    global SOrderNumber

    global node

    orderNumber1 = data.orderNumber
    data_to_print = "Time Stamp for Block: {0}\nStation: {1}\nSerial Number: {2}\nBlockHash: {3}\nPreviousHash: {4}".format(
        data.timeStamp, data.station, data.productCode, data.blockHash, data.previousHash)

    SblockTimeStamp[data.orderNumber][data.blockNumber] = data.timeStamp
    SblockTrans[data.orderNumber][data.blockNumber] = data.station
    SblockProductCode[data.orderNumber][data.blockNumber] = data.productCode
    SblockHash[data.orderNumber][data.blockNumber] = data.blockHash
    SblockPreviousHash[data.orderNumber][data.blockNumber] = data.previousHash

    # counter1 = counter1 + 1
    # rospy.loginfo(data_to_print)
    if runYet[orderNumber1] == '':
        f = open("/home/ros/blockChainGit/00blockChain_ws/blockChain" + str(orderNumber1) + ".txt", "w")
        f.close()
        runYet[orderNumber1] = "1"

    if runYet[orderNumber1] == "1":
        f = open("/home/ros/blockChainGit/00blockChain_ws/blockChain" + str(orderNumber1) + ".txt", "a")
        f.write(str(data_to_print))
        f.write("\n-------------------------------\n")
        f.close()


def authentication():
    rospy.Subscriber('Last_Hash', lastHash, callbackAuth)
    rospy.spin()


def callbackAuth(data):
    global Trigger
    global nodeONOFF
    global nodeList
    global authOrderNumber
    if data.nodeName in nodeList:
        nodeONOFF[nodeList.index(data.nodeName)] = 1  # filling in the online array
    # for i in range(10): #10 being a max node amount - can be changed as the array size is 100

    name = data.nodeName
    authOrderNumber = data.orderNumber
    # print("I heard: ")
    # print(node[data.orderNumber][int(name[4]) - 1])
    node[data.orderNumber][int(name[4]) - 1] = data.hash
    # print(node[data.orderNumber][int(name[4])])


def authTrigger():
    global Trigger
    global authOrderNumber
    global node

    while not rospy.is_shutdown():
        time.sleep(5)
        mostCommonHash = Counter(node[authOrderNumber])
        try:
            common = mostCommonHash.most_common(3)[2][0]
            print(nodeList[
                      node[authOrderNumber].index((mostCommonHash.most_common(3)[2][0]), 1)] + " has been hacked")
        except:
            man = "loves an easter egg"
    rospy.spin()


def emitter():
    global orderNumber
    global blockNumber
    global Trigger
    global station
    global SblockHash

    while not rospy.is_shutdown():
        for i in range(orderNumber + 1):
            pub = rospy.Publisher('Last_Hash', lastHash, queue_size=100)
            message2 = lastHash()
            message2.nodeName = "NODE1"
            message2.orderNumber = i
            message2.hash = SblockHash[i][SblockHash[i].index('', 1) - 1]
            pub.publish(message2)
            # print("emitter: ")
            # print(blockHash[i][blockHash[i].index('', 1) - 1])
            time.sleep(0.1)

    # rospy.spin()


def rewriteNodes():
    global blockString

    global SblockTimeStamp  # orderNumber,blockNumber
    global SblockTrans
    global SblockProductCode
    global SblockHash
    global SblockPreviousHash

    global SblockNumber
    global SOrderNumber

    time.sleep(10)
    message3 = rewriteNode()

    while not rospy.is_shutdown():
        try:

            time.sleep(1)

        except:
            print("didn'work lol")
            time.sleep(1)

    # try:
    #     for i in range ()
    #
    #
    # except:
    #     print("nah mate")


############################### TCP Server ###############################


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
                data = connection.recv(30)

                if data:
                    if data != '                              ':
                        dataFollowing = 1
                        # example: 1,1226,211,01,54,18,19,03,2019
                        # print data
                        try:
                            tcpStationName = data[0]
                            tcpOrderNumber = data[2] + data[3] + data[4] + data[5]
                            tcpCarrierNumber = 0
                            tcpProductCode = data[7] + data[8] + data[9]
                            tcpSeconds = data[11] + data[12]
                            tcpMinutes = data[14] + data[15]
                            tcpHours = data[17] + data[18]
                            tcpDays = data[20] + data[21]
                            tcpMonths = data[23] + data[24]
                            tcpYears = data[26] + data[27] + data[28] + data[29]

                            # print data
                            # print tcpStationName + ',' + tcpOrderNumber
                        except:
                            print "lower casting fail"
                    # time.sleep(1)
                else:
                    print >> sys.stderr, 'no more data from', client_address
                    dataFollowing = 0
                    break


        finally:
            # Clean up the connection
            connection.close()


# def manual():
#
#     global tcpStationName
#     global tcpOrderNumber
#     global tcpCarrierNumber
#     global tcpProductCode
#     global tcpSeconds
#     global tcpMinutes
#     global tcpHours
#     global tcpDays
#     global tcpMonths
#     global tcpYears
#
#     # Create a TCP/IP socket
#     sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#     # Then bind() is used to associate the socket with the server address. In this case, the address is localhost, referring to the current server, and the port number is 10000.
#
#     # Bind the socket to the port
#     server_address = ('172.21.4.152', 4501)
#     print sys.stderr, 'starting up on %s port %s' % server_address
#     sock.bind(server_address)
#     # Calling listen() puts the socket into server mode, and accept() waits for an incoming connection.
#
#     # Listen for incoming connections
#     sock.listen(1)
#
#     while True:
#         # Wait for a connection
#         print >> sys.stderr, 'waiting for a connection'
#         connection, client_address = sock.accept()
#         # accept() returns an open connection between the server and client, along with the address of the client. The connection is actually a different socket on another port (assigned by the kernel). Data is read from the connection with recv() and transmitted with sendall().
#
#         try:
#
#             print >> sys.stderr, 'connection from', client_address
#
#             # Receive the data in small chunks and retransmit it
#             while True:
#                 data = connection.recv(30)
#
#                 if data:
#                     if data != '                              ':
#                         # example: 1,1226,211,01,54,18,19,03,2019
#                         # print data
#                         try:
#                             tcpStationName = data[0]
#                             tcpOrderNumber = data[2] + data[3] + data[4] + data[5]
#                             tcpCarrierNumber = 0
#                             tcpSerialNumber = data[7] + data[8] + data[9]
#                             tcpSeconds = data[11] + data[12]
#                             tcpMinutes = data[14] + data[15]
#                             tcpHours = data[17] + data[18]
#                             tcpDays = data[20] + data[21]
#                             tcpMonths = data[23] + data[24]
#                             tcpYears = data[26] + data[27] + data[28] + data[29]
#
#                             # print data
#                             # print tcpStationName + ',' + tcpOrderNumber
#                         except:
#                             print "manual fail"
#                     # time.sleep(1)
#                 else:
#                     print >> sys.stderr, 'no more data from', client_address
#                     break
#
#
#         finally:
#             # Clean up the connection
#             connection.close()

# def cameraInspection():
#
#     global tcpStationName
#     global tcpOrderNumber
#     global tcpCarrierNumber
#     global tcpSerialNumber
#     global tcpSeconds
#     global tcpMinutes
#     global tcpHours
#     global tcpDays
#     global tcpMonths
#     global tcpYears
#
#     # Create a TCP/IP socket
#     sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#     # Then bind() is used to associate the socket with the server address. In this case, the address is localhost, referring to the current server, and the port number is 10000.
#
#     # Bind the socket to the port
#     server_address = ('172.21.4.152', 4502)
#     print sys.stderr, 'starting up on %s port %s' % server_address
#     sock.bind(server_address)
#     # Calling listen() puts the socket into server mode, and accept() waits for an incoming connection.
#
#     # Listen for incoming connections
#     sock.listen(1)
#
#     while True:
#         # Wait for a connection
#         print >> sys.stderr, 'waiting for a connection'
#         connection, client_address = sock.accept()
#         # accept() returns an open connection between the server and client, along with the address of the client. The connection is actually a different socket on another port (assigned by the kernel). Data is read from the connection with recv() and transmitted with sendall().
#
#         try:
#
#             print >> sys.stderr, 'connection from', client_address
#
#             # Receive the data in small chunks and retransmit it
#             while True:
#                 data = connection.recv(30)
#
#                 if data:
#                     if data != '                              ':
#                         # example: 1,1226,211,01,54,18,19,03,2019
#                         # print data
#                         try:
#                             tcpStationName = data[0]
#                             tcpOrderNumber = data[2] + data[3] + data[4] + data[5]
#                             tcpCarrierNumber = 0
#                             tcpSerialNumber = data[7] + data[8] + data[9]
#                             tcpSeconds = data[11] + data[12]
#                             tcpMinutes = data[14] + data[15]
#                             tcpHours = data[17] + data[18]
#                             tcpDays = data[20] + data[21]
#                             tcpMonths = data[23] + data[24]
#                             tcpYears = data[26] + data[27] + data[28] + data[29]
#
#                             # print data
#                             # print tcpStationName + ',' + tcpOrderNumber
#                         except:
#                             print "camera fail"
#                     # time.sleep(1)
#                 else:
#                     print >> sys.stderr, 'no more data from', client_address
#                     break
#
#
#         finally:
#             # Clean up the connection
#             connection.close()

if __name__ == '__main__':
    rospy.init_node('publishBlock', anonymous="True")
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        p1 = threading.Thread(target=listener, args=())
        p2 = threading.Thread(target=main, args=())
        p3 = threading.Thread(target=authentication, args=())
        p4 = threading.Thread(target=emitter, args=())
        p5 = threading.Thread(target=authTrigger, args=())
        p6 = threading.Thread(target=rewriteNodes, args=())
        p7 = threading.Thread(target=manual, args=())
        p8 = threading.Thread(target=lowerCasing, args=())
        p9 = threading.Thread(target=cameraInspection, args=())

        p1.daemon = True
        p2.daemon = True
        p3.daemon = True
        p4.daemon = True
        p5.daemon = True
        p6.daemon = True
        p7.daemon = True
        p8.daemon = True
        p9.daemon = True

        p1.start()
        p2.start()
        p3.start()
        p4.start()
        p5.start()
        p6.start()
        p7.start()
        p8.start()
        p9.start()

        p1.join()
        p2.join()
        p3.join()
        p4.join()
        p5.join()
        p6.join()
        p7.join()
        p8.join()
        p9.join()

# each stage of the production line needs to log:

#	- time => DONE!
#	- part number used => DONE!
#	- current product number => DONE!
#	- what stage of production line => DONE!

# this means I need an array of blockchains. One blockchain for one product => DONE!


# targets for tomorrow and Tuesday:

#   - broadcast onto another node (computer) => DONE!
#   - Make all nodes have the same data saved to text files => DONE(ish)!
#       - Fix bug with only the initial roslaunch receiving the first genesis block data. The rest of the nodes don't receive it, currently
#           - Idea: maybe all nodes keep track of how many nodes are on the network. Each time a node is launched it recieves a copy of everything
#             happend so far.
#           - blockChain.py send out 1 when initialised, if a listener hears it
#       - Change of plan, all nodes will be defined and all nodes will have a list of all other nodes on the network
#         initiated or not. This means as soon as a node comes on online it will be updated with the next authentication program.
#           - Each node needs to also be publishing it's name to a /nodesOnline topic and the listeners will create an array comparing nodes online
#             to a text file of all possible nodes.
#                   - Using just a list instead because it's easier
#                           - Need to create a catchUpListner.py program so it can receive an updated blockchain file after authentication.
#                                   - For the authentication program, possibley need it seperate as a authenticate.py program.
#   - use blockchain authentiation to validate data.

# Authentication ideas:
#	- new script and stream for ask all nodes to do an authentication check
# 	- possibly all nodes remake their blocks and send their hashes to every other node.
#	- every other node will listen for other nodes' blockchains and the node names and create an array.
# 	- if any of the hashes are different are different, that node will be deactivated.


# - look up what a UTXO data set is in blockchain


#   - rewrite node will rewrite the node that's next to it in terms of numbers
#       - for example, if NODE4 is compromised then NODE3 will rewrite it has there isn't currently a NODE5.
#       - if NODE2 is infected, try NODE1, if not, NODE3.
