#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket
from datetime import datetime
from collections import Counter
from blockChainPack_.msg import blockDetail
from blockChainPack_.msg import lastHash
from blockChainPack_.msg import rewriteNode

# station, orderNumber, productCode, seconds, minutes, hours, days, months, years
# productNubmer should now orderNumber

Range = 200
cRange = 4
itemNumber = 0
dataFollowing = 0
orderNumber = 0
station = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("8%")
productCode = [''] * Range
block = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("16%")
blockNumber = 0
orderNcarrierNumberList = [['' for _ in range(cRange)] for _ in range(Range)]
print("24%")
buildBlock = 0
oldData = ''
emit = False

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
runYet = [['' for _ in range(Range)] for _ in range(Range)]
Trigger = False
nodeList = ['NODE1', 'NODE2', 'NODE3',
            'NODE4']  ################# IF INCLUDING MORE NODES, EXTEND THIS ARRAY SIZE #######################
nodeONOFF = [1, 0, 0, 0]  ################# IF INCLUDING MORE NODES, EXTEND THIS ARRAY SIZE #######################
oldNodeONOFF = [0, 0, 0, 0]  ################# IF INCLUDING MORE NODES, EXTEND THIS ARRAY SIZE #######################
node = ['' for _ in range(20)]
print("29%")
counter1 = 0;

SblockTimeStamp = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("37%")
SblockTrans = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("46%")
SblockProductCode = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("55%")
SblockHash = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("64%")
SblockPreviousHash = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("73%")
SblockNumber = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("82%")
SOrderNumber = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("91%")
SCarrierNumber = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("100%")
print("Loading network..")
Sblock = ''
authOrderNumber = 0
blockString = ''
nodeName = "NODE3"  ############### THIS IS WHERE YOU SPECIFY A NODE'S NAME #######################

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

# Emitter
hashingArray = ''

#Rewrite
nodeToRewrite = 10

#authTrigger
mostCommonHash = ''


class blockChain:

    def __init__(self, previousHash, station, productCode, orderNumber, carrierID, seconds, minutes, hours, days,
                 months, years):
        self.timeStamp = str(hours + ':' + minutes + ':' + seconds + ' - ' + days + '/' + months + '/' + years)
        self.productCode = productCode
        self.orderNumber = orderNumber
        self.carrierID = carrierID
        self.previousHash = previousHash
        self.station = station
        self.contains = hashlib.sha256(self.station.encode()).hexdigest() + previousHash + str(
            self.timeStamp) + str(self.productCode) + str(self.orderNumber) + str(self.carrierID)
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

    def getCarrierID(self):
        return self.carrierID


def blockUpdate(blockNumber, orderNumber, carrierID, station, productCode, seconds, minutes, hours, days, months,
                years):
    global SblockHash

    for i in range(blockNumber, blockNumber + 1):
        blockNumber = i
        block[orderNumber][tcpCarrierNumber][blockNumber] = blockChain(
            previousHash=SblockHash[tcpOrderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1], station=station,
            productCode=productCode, orderNumber=orderNumber, carrierID=carrierID, seconds=seconds, minutes=minutes,
            hours=hours, days=days, months=months, years=years)
        # print("blockUpdate")
        # print(SblockHash[1243][0])
        # print("blockUpdate previous hash" + SblockHash[tcpOrderNumber][blockNumber])
        print(block[orderNumber][tcpCarrierNumber][blockNumber].getBlockHash())


def sendMessage():
    global message
    global orderNumber
    global block
    try:
        message = blockDetail()
        message.blockNumber = block[orderNumber][tcpCarrierNumber].index('') - 1
        message.timeStamp = block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getTimeStamp()
        message.station = str(block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getStation())
        message.orderNumber = block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getOrderNumber()
        message.carrierID = block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getCarrierID()
        message.productCode = block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getProductCode()
        message.blockHash = block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getBlockHash()
        message.previousHash = block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getPreviousHash()
        # print(block[orderNumber][block[orderNumber].index('') - 1].getPreviousHash())

    except:
        print("send message error")


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
    global orderNcarrierNumberList
    global dataFollowing
    global SblockNumber

    pub = rospy.Publisher('publishingBlockStream', blockDetail, queue_size=100)
    while not rospy.is_shutdown():
        if dataFollowing == 1:

            # Setup for genesis block
            orderNumber = tcpOrderNumber
            # print(orderNumber)
            # print("trying to build")
            try:
                # print("Trying to create block")
                if orderNcarrierNumberList[tcpOrderNumber][tcpCarrierNumber].index(1) > -1:
                    newGenesis = 0
            except:
                # print("exception")
                if SCarrierNumber[tcpOrderNumber][tcpCarrierNumber] != 1:
                    newGenesis = 1
                    # print("Order number not a thing, creating a new blockchain")

                else:  # this node has already published information
                    newGenesis = 0

            # Genesis Block
            # print(SblockHash[orderNumber].index('') == 0)
            if newGenesis == 1:
                block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('')] = blockChain(
                    previousHash='',
                    station="Start production",
                    productCode=tcpProductCode,
                    orderNumber=tcpOrderNumber, carrierID=tcpCarrierNumber,
                    seconds=str(datetime.now())[17:19],
                    minutes=str(datetime.now())[14:16],
                    hours=str(datetime.now())[11:13],
                    days=str(datetime.now())[8:10],
                    months=str(datetime.now())[5:7],
                    years=str(datetime.now())[0:4])
                orderNcarrierNumberList[tcpOrderNumber][tcpCarrierNumber] = 1
                print("genesis: ")
                print(block[orderNumber][tcpCarrierNumber][
                    block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getBlockHash())

                time.sleep(1)
                # print("sending message in gen1")
                sendMessage()
                pub.publish(message)
                # print(orderNumber, blockNumber)
                # print(block[orderNumber].index(('')))
                blockNumber = block[tcpOrderNumber][tcpCarrierNumber].index(
                    '')  # key part, as each station uploads information, this variable is incremented to generate a new block
                # print(orderNumber, blockNumber)
                # print(block[orderNumber][blockNumber - 1].getBlockHash())
                newGenesis = 0

            if newGenesis == 0:
                time.sleep(1)
                blockUpdate(blockNumber=block[tcpOrderNumber][tcpCarrierNumber].index(''), orderNumber=tcpOrderNumber,
                            station=tcpStationName, carrierID=tcpCarrierNumber, productCode=tcpProductCode,
                            seconds=tcpSeconds, minutes=tcpMinutes, hours=tcpHours, days=tcpDays, months=tcpMonths,
                            years=tcpYears)
                # print("sending message in gen0")
                # print(block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1])

                sendMessage()
                time.sleep(1)
                pub.publish(message)
                # print(orderNumber, blockNumber)
                blockNumber = block[tcpOrderNumber][tcpCarrierNumber].index('')
                newGenesis = 3
                dataFollowing = 0

        # if the order number doesn't exist in the array then create genesis block. If it does, then continue where the system left off.


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
    global SCarrierNumber

    global SblockNumber
    global SOrderNumber

    global node
    global emit

    emit = True

    orderNumber1 = data.orderNumber
    data_to_print = "Time Stamp for Block: {0}\nStation: {1}\nOrder Number: {2}\nCarrierID: {3}\nProduct Code: {4}\nBlock Hash: {5}\nPrevious Hash: {6}".format(
        data.timeStamp, data.station, data.orderNumber + 1264, data.carrierID, data.productCode, data.blockHash,
        data.previousHash)
    # print(SblockHash[orderNumber][0] == '')
    SblockTimeStamp[data.orderNumber][data.carrierID][data.blockNumber] = data.timeStamp
    SblockTrans[data.orderNumber][data.carrierID][data.blockNumber] = data.station
    SblockProductCode[data.orderNumber][data.carrierID][data.blockNumber] = data.productCode
    SblockHash[data.orderNumber][data.carrierID][data.blockNumber] = data.blockHash
    SblockPreviousHash[data.orderNumber][data.carrierID][data.blockNumber] = data.previousHash
    SCarrierNumber[data.orderNumber][data.carrierID] = 1

    SblockNumber = data.blockNumber

    # block[orderNumber][blockNumber] = blockChain(
    #     previousHash=SblockHash[tcpOrderNumber][block[orderNumber].index('') - 1], station=station,
    #     productCode=productCode, orderNumber=orderNumber, seconds=seconds, minutes=minutes,
    #     hours=hours, days=days, months=months, years=years)

    # hours + ':' + minutes + ':' + seconds + ' - ' + days + '/' + months + '/' + years

    # 18:54:01 - 19 / 03 / 2019
    # print(block[data.orderNumber][data.carrierID][data.blockNumber])
    # print(data.timeStamp)
    # print(data.timeStamp[6] + data.timeStamp[7])
    # print(data.timeStamp[3] + data.timeStamp[4])
    # print(data.timeStamp[0] + data.timeStamp[1])
    # print(data.timeStamp[11] + data.timeStamp[12])
    # print(data.timeStamp[14] + data.timeStamp[15])
    # print(data.timeStamp[17] + data.timeStamp[18] + data.timeStamp[19] + data.timeStamp[20])
    # print(data_to_print)
    # print("blockNumber: {0}".format(data.blockNumber))
    # print("callback")
    # print(block[data.orderNumber][data.carrierID][data.blockNumber])
    if block[data.orderNumber][data.carrierID][data.blockNumber] == '':
        block[data.orderNumber][data.carrierID][data.blockNumber] = blockChain(previousHash=data.previousHash,
                                                                               station=data.station,
                                                                               productCode=data.productCode,
                                                                               orderNumber=data.orderNumber,
                                                                               carrierID=data.carrierID,
                                                                               seconds=data.timeStamp[6] + data.timeStamp[7],
                                                                               minutes=data.timeStamp[3] + data.timeStamp[4],
                                                                               hours=data.timeStamp[0] + data.timeStamp[1],
                                                                               days=data.timeStamp[11] + data.timeStamp[12],
                                                                               months=data.timeStamp[14] + data.timeStamp[15],
                                                                               years=data.timeStamp[17] + data.timeStamp[18] + data.timeStamp[19] +
                                                                                     data.timeStamp[20])

    if runYet[data.orderNumber][data.carrierID] == '':
        f = open("/home/ros/blockChainGit/00blockChain_ws/Product" + str(data.orderNumber + 1264) + "C:" + str(
            data.carrierID) + ".txt", "w")
        f.close()
        runYet[data.orderNumber][data.carrierID] = "1"

    if runYet[data.orderNumber][data.carrierID] == "1":
        f = open("/home/ros/blockChainGit/00blockChain_ws/Product" + str(data.orderNumber + 1264) + "C:" + str(
            data.carrierID) + ".txt", "a")
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
        #print(data.nodeName + " is online!")
    # for i in range(10): #10 being a max node amount - can be changed as the array size is 100

    name = data.nodeName

    node[int(name[4]) - 1] = data.hash
    # print("finding node 4")
    # print(node)

def authTrigger():
    global Trigger
    global authOrderNumber
    global node
    global nodeToRewrite
    global mostCommonHash
    global nodeName

    while not rospy.is_shutdown():
        time.sleep(5)
        mostCommonHash = Counter(node)

        # print(mostCommonHash.most_common(3))
        try:
            print(nodeList[(node.index(str(mostCommonHash.most_common(3)[2][0])))] + " has been hacked")
            nodeToRewrite = nodeList[(node.index(str(mostCommonHash.most_common(3)[2][0])))]

            if nodeList[(node.index(str(mostCommonHash.most_common(3)[2][0])))] != nodeName:
                rewriteNodes()

        except:
            print("all fine")

    rospy.spin()


def emitter():
    global orderNumber
    global blockNumber
    global Trigger
    global station
    global SblockHash
    global hashingArray
    global emit

    pub = rospy.Publisher('Last_Hash', lastHash, queue_size=100)

    while not rospy.is_shutdown():
        if emit == True:
            for i in range(len(SblockHash)):
                for j in range(len(SblockHash[i])):
                    for z in range(len(SblockHash[i][j])):
                        hashingArray = hashlib.sha256(hashingArray + SblockHash[i][j][z]).hexdigest()


            message2 = lastHash()
            message2.hash = hashingArray
            message2.nodeName = 'NODE3'
            pub.publish(message2)
            hashingArray = ''
            time.sleep(1)


def recNewData():
    global nodeName
    global node
    global nodeList
    global mostCommonHash

    try:
        if nodeList[(node.index(str(mostCommonHash.most_common(3)[2][0])))] == nodeName:
            rospy.Subscriber('Rewrite', rewriteNode, callbackRecData)
    except:
        ye = "man"

    rospy.spin()


def callbackRecData(data):
    global timestamp
    global block
    global SblockHash
    global Range
    global cRange
    global Rdone
    # 32,3,1,18:54:01 - 19/03/2019,1,211
    # 32,3,0,09:57:40 - 06/04/2019,Start production,211
    print("rewriting")
    dataSplit = data.SblockTimeStamp.split(",")

    dOrder = int(dataSplit[0])
    dCarrier = int(dataSplit[1])
    dBlock = int(dataSplit[2])
    dHour = str((dataSplit[3])[0] + (dataSplit[3])[1])
    dMinute = str((dataSplit[3])[3] + (dataSplit[3])[4])
    dSecond = str((dataSplit[3])[6] + (dataSplit[3])[7])
    dDay = str((dataSplit[3])[11] + (dataSplit[3])[12])
    dMonth = str((dataSplit[3])[14] + (dataSplit[3])[15])
    dYear = str((dataSplit[3])[17] + (dataSplit[3])[18] + (dataSplit[3])[19] + (dataSplit[3])[20])
    dStation = dataSplit[4]
    dProductCode = int(dataSplit[5])

    try:
        if data.done == 1 and Rdone == 0 and nodeList[(node.index(str(mostCommonHash.most_common(3)[2][0])))] == nodeName:
            SblockHash = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
            block = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
            Rdone = 1

    except:
        print("init wipe didn't work")

    try:
        if nodeList[(node.index(str(mostCommonHash.most_common(3)[2][0])))] == nodeName:

            if dStation == "Start production":
                print("1")
                # print(data.SblockTimeStamp)
                block[int(dOrder)][int(dCarrier)][int(dBlock)] = blockChain(previousHash='',
                                                                            station=dStation,
                                                                            productCode=dProductCode,
                                                                            orderNumber=dOrder,
                                                                            carrierID=dCarrier,
                                                                            seconds=dSecond,
                                                                            minutes=dMinute,
                                                                            hours=dHour,
                                                                            days=dDay,
                                                                            months=dMonth,
                                                                            years=dYear)

                SblockHash[dOrder][dCarrier][dBlock] = block[dOrder][dCarrier][dBlock].getBlockHash()
                # print(block[dOrder][dCarrier][dBlock].getBlockHash())

            if dStation != "Start production":
                print("2")
                # print(data.SblockTimeStamp)
                block[int(dOrder)][int(dCarrier)][int(dBlock)] = blockChain(
                    previousHash=block[int(dOrder)][int(dCarrier)][int(dBlock) - 1].getBlockHash(),
                    station=dStation,
                    productCode=dProductCode,
                    orderNumber=dOrder,
                    carrierID=dCarrier,
                    seconds=dSecond,
                    minutes=dMinute,
                    hours=dHour,
                    days=dDay,
                    months=dMonth,
                    years=dYear)
                print("2.1")

                SblockHash[dOrder][dCarrier][dBlock] = block[dOrder][dCarrier][dBlock].getBlockHash()
                # print(block[dOrder][dCarrier][dBlock].getBlockHash())

                print("2.2")

            if data.done == 0:
                hashingArray = ''
                Rdone = 0
                for i in range(len(SblockHash)):
                    for j in range(len(SblockHash[i])):
                        for z in range(len(SblockHash[i][j])):
                            hashingArray = hashlib.sha256(hashingArray + SblockHash[i][j][z]).hexdigest()

                print("2.3")

                print(hashingArray)
                print("got rewritten")

    except:
        print("couldn't rewrite")


def rewriteNodes():
    global blockString
    global SblockTimeStamp  # orderNumber,blockNumber
    global SblockTrans
    global SblockProductCode
    global SblockHash
    global SblockPreviousHash
    global SblockNumber
    global SOrderNumber
    global Range
    global cRange
    global nodeToRewrite

    # rewrite NODE(nodeNumber)
    pub = rospy.Publisher('Rewrite', rewriteNode, queue_size=100)

    # if nodeNumber == int(nodeName[4]) + 1 :
    # this node will rewrite the hacked node



    strData = ''

    print("rewrite commence")
    message3 = rewriteNode()

    #TimeStamp


    for i in range(Range):
        for j in range(cRange):
            for z in range(Range):
                if SblockTimeStamp[i][j][z] != '':
                        strData = str(i) + ',' + str(j) + ',' + str(z) + ',' + SblockTimeStamp[i][j][z] + ',' + str(SblockTrans[i][j][z]) + ',' + str(SblockProductCode[i][j][z])
                        message3.SblockTimeStamp = strData
                        message3.done = 1
                        pub.publish(message3)


    message3.done = 0
    pub.publish(message3)
    print("finished")




############################### TCP Server ###############################


def manual():
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
    global oldData

    # Create a TCP/IP socket
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Then bind() is used to associate the socket with the server address. In this case, the address is localhost, referring to the current server, and the port number is 10000.

    # Bind the socket to the port
    server_address = ('127.0.0.1', 4502)
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
                data = connection.recv(32)

                if data:

                    if data == '                               ':
                        dataFollowing = 0
                    if data != '                                ':

                        # example: 1,1230, 211,48, 6,18,21, 3,2019
                        # print data
                        try:
                            # print(data)
                            if oldData != data:
                                # print(data)
                                tcpStationName = data[0]
                                tcpOrderNumber = int(data[2] + data[3] + data[4] + data[5]) - 1264
                                tcpCarrierNumber = int(data[7])
                                tcpProductCode = int(data[9] + data[10] + data[11])
                                tcpSeconds = data[13] + data[14]
                                tcpMinutes = data[16] + data[17]
                                tcpHours = data[19] + data[20]
                                tcpDays = data[22] + data[23]
                                tcpMonths = data[25] + data[26]
                                tcpYears = data[28] + data[29] + data[30] + data[31]
                                dataFollowing = 1
                                oldData = data
                                # print(dataFollowing)

                            # print data
                            # print tcpStationName + ',' + tcpOrderNumber
                        except:
                            print "manual fail"
                            print('.' + data + '.')
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
    rospy.init_node('publishBlock', anonymous="True")
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        p1 = threading.Thread(target=listener, args=())
        p2 = threading.Thread(target=mainProg, args=())
        p3 = threading.Thread(target=authentication, args=())
        p4 = threading.Thread(target=emitter, args=())
        p5 = threading.Thread(target=authTrigger, args=())
        p6 = threading.Thread(target=recNewData, args=())
        # p7 = threading.Thread(target=sendMessage, args=())
        p8 = threading.Thread(target=manual, args=())
        # p9 = threading.Thread(target=blockUpdate, args=())

        p1.daemon = True
        p2.daemon = True
        p3.daemon = True
        p4.daemon = True
        p5.daemon = True
        p6.daemon = True
        # p7.daemon = True
        p8.daemon = True
        # p9.daemon = True

        p1.start()
        p2.start()
        p3.start()
        p4.start()
        p5.start()
        p6.start()
        # p7.start()
        p8.start()
        # p9.start()

        p1.join()
        p2.join()
        p3.join()
        p4.join()
        p5.join()
        p6.join()
        # p7.join()
        p8.join()
        # p9.join()

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


# carriage numbers:
# - 4 reads 3
# - 2 reads 4
# - 1 reads 3
# - 3 reads 3

# Once a node has been found to have been compromised, the node will be rebooted. Once a new node is on the network, the node needs
# to be updated with all the current data.

# station[][][]
# block[][][]
# orderNcarrierNumberList[][]
# runYet[][]
# nodeList[]
# nodeONOFF[]
# oldNodeONOFF[]
# node[]
# SblockTimeStamp[][][]
# SblockTrans[][][]
# SblockProductCode[][][]
# SblockHash[][][]
# SblockPreviousHash[][][]
# SCarrierNumber[][][]