#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket, os, glob, rosnode
from datetime import datetime
from collections import Counter
from shutil import copyfile
from blockChainPack_.msg import blockDetail
from blockChainPack_.msg import lastHash
from blockChainPack_.msg import rewriteNode
from blockChainPack_.msg import finish
from std_msgs.msg import String

# station, orderNumber, productCode, seconds, minutes, hours, days, months, years
# productNubmer should now orderNumber

nodeName = "NODE1"  ############### THIS IS WHERE YOU SPECIFY A NODE'S NAME #######################
port = 4500
address = '172.21.4.153'  # 127.0.0.1
lNodeToRewrite = "NODE2"
dataDes1 = "No data available"
dataDes2 = "No data available"
dataMag1 = 10
dataMag2 = 10

Range = 200
cRange = 5
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
Comp = False
fCarrier = 0
fOrder = 0
dCounter = 0

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
            'NODE4', 'NODE5', 'NODE6']  ################# IF INCLUDING MORE NODES, EXTEND THIS ARRAY SIZE #######################
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
Sdata = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
print("100%")
print("Loading network..")
Sblock = ''
authOrderNumber = 0
blockString = ''

nodeHacked = ''
stationHistory = [['' for _ in range(7)] for _ in range(5)]
REcounter = [0] * Range

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
tcpData1 = 0
tcpData2 = 0

# Class
seconds = 0
minutes = 0
hours = 0
days = 0
months = 0
years = 0

# Emitter
hashingArray = ''

# Rewrite
nodeToRewrite = 10
Rdone = 0
logHash = ''
runYetLoc = [['' for _ in range(Range)] for _ in range(Range)]

# authTrigger
mostCommonHash = ''

# camera
camAddress = 0


class blockChain:

    def __init__(self, previousHash, station, productCode, orderNumber, carrierID, seconds, minutes, hours, days,
                 months, years, data1, data2):
        self.timeStamp = str(hours + ':' + minutes + ':' + seconds + ' - ' + days + '/' + months + '/' + years)
        self.productCode = productCode
        self.orderNumber = orderNumber
        self.carrierID = carrierID
        self.previousHash = previousHash
        self.station = station
        self.data1 = data1
        self.data2 = data2
        self.contains = hashlib.sha256(self.station.encode()).hexdigest() + previousHash + str(
            self.timeStamp) + str(self.productCode) + str(self.orderNumber) + str(self.carrierID) + str(data1) + str(data2)
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

    def getData1(self):
        return self.data1

    def getData2(self):
        return self.data2


def blockUpdate(blockNumber, orderNumber, carrierID, station, productCode, seconds, minutes, hours, days, months,
                years, data1, data2):
    global SblockHash

    for i in range(blockNumber, blockNumber + 1):
        blockNumber = i
        block[orderNumber][tcpCarrierNumber][blockNumber] = blockChain(
            previousHash=SblockHash[tcpOrderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1],
            station=station,
            productCode=productCode, orderNumber=orderNumber, carrierID=carrierID, seconds=seconds, minutes=minutes,
            hours=hours, days=days, months=months, years=years, data1=data1, data2=data2)
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
        message.timeStamp = block[orderNumber][tcpCarrierNumber][
            block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getTimeStamp()
        message.station = str(
            block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getStation())
        message.orderNumber = block[orderNumber][tcpCarrierNumber][
            block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getOrderNumber()
        message.carrierID = block[orderNumber][tcpCarrierNumber][
            block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getCarrierID()
        message.productCode = block[orderNumber][tcpCarrierNumber][
            block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getProductCode()
        message.blockHash = block[orderNumber][tcpCarrierNumber][
            block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getBlockHash()
        message.previousHash = block[orderNumber][tcpCarrierNumber][
            block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getPreviousHash()
        message.data1 = block[orderNumber][tcpCarrierNumber][
            block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getData1()
        message.data2 = block[orderNumber][tcpCarrierNumber][
            block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getData2()
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
    global Range
    global REcounter
    global nodeName
    global Comp
    global fCarrier
    global fOrder
    global dCounter

    wipe = False

    pub = rospy.Publisher('publishingBlockStream', blockDetail, queue_size=100)
    pub2 = rospy.Publisher('ProductFinished', finish, queue_size=100)
    # while not rospy.is_shutdown():
    stationFinish = False

    # Setup for genesis block
    orderNumber = tcpOrderNumber
    # print(orderNumber)
    # print("trying to build")
    try:
        print("Trying to create block")
        if orderNcarrierNumberList[tcpOrderNumber][tcpCarrierNumber].index(1) > -1:
            newGenesis = 0
    except:
        print("exception")
        if SCarrierNumber[tcpOrderNumber][tcpCarrierNumber] != 1:
            newGenesis = 1
            print("Order number not a thing, creating a new blockchain")

        else:  # this node has already published information
            newGenesis = 0

    # Genesis Block
    # print(SblockHash[orderNumber].index('') == 0)
    if newGenesis == 1 and tcpStationName == '1':
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
            years=str(datetime.now())[0:4], data1='', data2='')
        orderNcarrierNumberList[tcpOrderNumber][tcpCarrierNumber] = 1
        print("genesis: ")
        print(block[orderNumber][tcpCarrierNumber][
            block[tcpOrderNumber][tcpCarrierNumber].index('') - 1].getBlockHash())

        time.sleep(0.5)
        print("sending message in gen1")
        sendMessage()
        pub.publish(message)
        print(orderNumber, blockNumber)
        # print(block[orderNumber].index(('')))
        blockNumber = block[tcpOrderNumber][tcpCarrierNumber].index(
            '')  # key part, as each station uploads information, this variable is incremented to generate a new block
        # print(orderNumber, blockNumber)
        # print(block[orderNumber][blockNumber - 1].getBlockHash())
        newGenesis = 0

    if newGenesis == 0:
        time.sleep(0.3)
        print("newgen = 0 " + tcpStationName)
        if tcpStationName in stationHistory[int(tcpCarrierNumber)] and tcpStationName == '2':
            print("is " + tcpStationName)
            message.blockNumber = 0
            message.orderNumber = tcpOrderNumber
            message.carrierID = tcpCarrierNumber
            message.timeStamp = '00:00:00 - 00 / 00 / 0000'  # 18:54:01 - 19 / 03 / 2019
            message.station = tcpStationName
            message.productCode = 0
            message.blockHash = ''
            message.previousHash = ''
            message.data1 = ''
            message.data2 = ''
            time.sleep(0.3)
            pub.publish(message)
            dataFollowing = 0
            stationFinish = True
            newGenesis = 3
        print("294 " + tcpStationName)

        if tcpStationName not in stationHistory[int(tcpCarrierNumber)] and stationFinish == False:
            print("1")
            blockUpdate(blockNumber=block[tcpOrderNumber][tcpCarrierNumber].index(''), orderNumber=tcpOrderNumber,
                        station=tcpStationName, carrierID=tcpCarrierNumber, productCode=tcpProductCode,
                        seconds=tcpSeconds, minutes=tcpMinutes, hours=tcpHours, days=tcpDays, months=tcpMonths,
                        years=tcpYears, data1=tcpData1, data2=tcpData2)
            print("sending message in gen0")
            # print(block[orderNumber][tcpCarrierNumber][block[tcpOrderNumber][tcpCarrierNumber].index('') - 1])
            sendMessage()
            time.sleep(0.3)
            pub.publish(message)
            print(orderNumber, blockNumber)
            blockNumber = block[tcpOrderNumber][tcpCarrierNumber].index('')
            newGenesis = 3
            dataFollowing = 0
            print("dataFollowing1", dataFollowing)

        else:
            newGenesis = 3
            dataFollowing = 0
            print("datafollowing2", dataFollowing)
    else:
        newGenesis = 3
        dataFollowing = 0
        print("datafollowing3", dataFollowing)


#
#     print("datafollowing4", dataFollowing)
# print("datafollowing5", dataFollowing)

# stationHistory[int(tcpCarrierNumber)][int(tcpStationName)] = tcpStationName
# print(stationHistory)

# if stationHistory[int(tcpCarrierNumber)] == ['Start production', '1', '2', '3']:
#
#     message4 = finish()
#     message4.counter = REcounter
# #     message4.carrierID = int(tcpCarrierNumber)
# #     message4.order = int(tcpOrderNumber)
#     pub2.publish(message4)
#
#     time.sleep(0.2)
#
#     os.rename(
#         "/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + "/Product" + str(tcpOrderNumber + 1264) + "C:" + str(
#         tcpCarrierNumber) + ".txt", "/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + "/Product" + str(tcpOrderNumber + 1264) + "C:" + str(
#     tcpCarrierNumber) + "Comp" + str(REcounter) + ".txt")
#     print("Carrier ready for next product")
#
#     REcounter = REcounter + 1
#
#     # print("2")
#     # print(tcpStationName)
#     # if Comp == True:  # means the product is finished
#     block[tcpOrderNumber][tcpCarrierNumber] = [''] * Range
#     SCarrierNumber[tcpOrderNumber][tcpCarrierNumber] = [''] * Range
#     stationHistory[int(tcpCarrierNumber)] = [''] * 4
#     runYet[tcpOrderNumber][tcpCarrierNumber] = ''

# Comp = False


# if the order number doesn't exist in the array then create genesis block. If it does, then continue where the system left off.


def listener():
    rospy.Subscriber('publishingBlockStream', blockDetail, callback)
    rospy.spin()


def finishListener():
    rospy.Subscriber('ProductFinished', finish, callbackFinish)
    rospy.spin()


def callbackFinish(data):
    global Comp
    global stationHistory
    global fCarrier
    global fOrder
    global dCounter
    global REcounter

    # Comp = True
    # fCarrier = data.carrierID
    # fOrder = data.order
    # REcounter = data.counter


def callback(data):
    global runYet
    global counter1
    global nodeName
    global Range

    global SblockTimeStamp
    global SblockTrans
    global SblockProductCode
    global SblockHash
    global SblockPreviousHash
    global SCarrierNumber
    global Sdata

    global SblockNumber
    global SOrderNumber

    global node
    global emit

    global stationHistory
    global Comp

    global camAddress

    wipe = False
    print(data.station)
    print(stationHistory)

    if data.station in stationHistory[int(data.carrierID)]:
        print("call back 1 " + data.station)
        if data.station == '2':
            print("call back 2")
            print(stationHistory)
            if stationHistory[int(data.carrierID)] == ['Start production', '1', '2', '3', '4', '5', '6']:
                print("call back 3")

                os.rename(
                    "/home/pi/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + "/Product" + str(
                        data.orderNumber + 1264) + "C:" + str(
                        data.carrierID) + ".txt",
                    "/home/pi/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + "/Product" + str(
                        data.orderNumber + 1264) + "C:" + str(
                        data.carrierID) + "Comp" + str(REcounter[int(data.carrierID)]) + ".txt")

                # print("camAddress: ", camAddress)
                # copyfile("/home/pi/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + "/Product" + str(
                #     data.orderNumber + 1264) + "C:" + str(data.carrierID) + "Comp" + str(REcounter[int(data.carrierID)]) + ".txt",
                #          "/home/pi/blockChainGit/00blockChain_ws/src/blockChainPack_/src/scripts/CompletedReceiptsQR/" + str(
                #              camAddress) + "/" + "Product" + str(
                #              data.orderNumber + 1264) + "C:" + str(data.carrierID) + "Comp" + str(
                #              REcounter[int(data.carrierID)]) + ".txt")
                # print("copied")

                block[data.orderNumber][data.carrierID] = [''] * Range
                SCarrierNumber[data.orderNumber][data.carrierID] = [''] * Range
                SblockHash[data.orderNumber][data.carrierID] = [''] * Range
                SblockTimeStamp[data.orderNumber][data.carrierID] = [''] * Range
                SblockTrans[data.orderNumber][data.carrierID] = [''] * Range
                SblockProductCode[data.orderNumber][data.carrierID] = [''] * Range
                runYet[data.orderNumber][data.carrierID] = ''

                REcounter[int(data.carrierID)] = REcounter[int(data.carrierID)] + 1
                wipe = True
                print("Carrier ready for next product")

    if data.station not in stationHistory[int(data.carrierID)]:

        orderNumber1 = data.orderNumber
        data_to_print = "Time Stamp for Block: {0}\nStation: {1}\nOrder Number: {2}\nCarrierID: {3}\nProduct Code: {4}\nBlock Hash: {5}\nPrevious Hash: {6}\n{7}\n{8}".format(
            data.timeStamp, data.station, data.orderNumber + 1264, data.carrierID, data.productCode, data.blockHash,
            data.previousHash, data.data1, data.data2)
        # print(SblockHash[orderNumber][0] == '')
        SblockTimeStamp[data.orderNumber][data.carrierID][data.blockNumber] = data.timeStamp
        SblockTrans[data.orderNumber][data.carrierID][data.blockNumber] = data.station
        SblockProductCode[data.orderNumber][data.carrierID][data.blockNumber] = data.productCode
        SblockHash[data.orderNumber][data.carrierID][data.blockNumber] = data.blockHash
        SblockPreviousHash[data.orderNumber][data.carrierID][data.blockNumber] = data.previousHash
        Sdata[data.orderNumber][data.carrierID][data.blockNumber] = data.data1 + ' ' + data.data2
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
                                                                                   years=data.timeStamp[17] + data.timeStamp[18] +
                                                                                         data.timeStamp[19] +
                                                                                         data.timeStamp[20], data1=data.data1,
                                                                                   data2=data.data2)

        if stationHistory[int(data.carrierID)] != ['Start production', '1', '2', '3', '4', '5', '6']:
            print(data.station)
            if data.station != 'Start production':
                stationHistory[int(data.carrierID)][int(data.station)] = str(data.station)

            if data.station == 'Start production':
                stationHistory[int(data.carrierID)][0] = str(data.station)

            if runYet[data.orderNumber][data.carrierID] == '':
                f = open("/home/pi/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + "/Product" + str(
                    data.orderNumber + 1264) + "C:" + str(
                    data.carrierID) + ".txt", "w")
                f.close()
                runYet[data.orderNumber][data.carrierID] = "1"

            if runYet[data.orderNumber][data.carrierID] == "1":
                f = open("/home/pi/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + "/Product" + str(
                    data.orderNumber + 1264) + "C:" + str(
                    data.carrierID) + ".txt", "a")
                f.write(str(data_to_print))
                f.write("\n-------------------------------\n")
                f.close()

    if wipe == True:
        stationHistory[int(data.carrierID)] = [''] * 7
        print(stationHistory)
        wipe = False

    emit = True


def authentication():
    rospy.Subscriber('Last_Hash', lastHash, callbackAuth)
    rospy.spin()


def callbackAuth(data):
    global Trigger
    global nodeONOFF
    global nodeList
    global authOrderNumber
    global mostCommonHash

    if data.nodeName in nodeList:
        nodeONOFF[nodeList.index(data.nodeName)] = 1  # filling in the online array
        # print(data.nodeName + " is online!")
    # for i in range(10): #10 being a max node amount - can be changed as the array size is 100

    name = data.nodeName

    node[int(name[4]) - 1] = data.hash
    mostCommonHash = Counter(node)
    # print("finding node 4")
    # print(node)


def emitter():
    global orderNumber
    global blockNumber
    global Trigger
    global station
    global SblockHash
    global hashingArray
    global emit
    global nodeName

    pub = rospy.Publisher('Last_Hash', lastHash, queue_size=100)

    fileNames = [''] * 200
    fileAmount = [''] * 50
    REcounter = [''] * 200
    counter = 0
    counter2 = 0
    logHash = ''

    while not rospy.is_shutdown():  # THIS IS PROBABLY A CPU POWER DRAINER

        os.chdir("/home/pi/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName)
        for i in glob.glob("*.txt"):
            fileAmount[counter2] = i
            if "Comp" in i:
                fileNames[counter] = i
                fileNames[counter] = fileNames[counter].replace(".txt", "")
                REcounter[counter] = int(str(fileNames[counter])[18])
                counter = counter + 1
            counter2 = counter2 + 1

        counter = 0
        counter2 = 0
        fileNum = fileAmount.index('')

        if emit == True:
            for i in range(len(SblockHash)):
                for j in range(len(SblockHash[i])):
                    for z in range(len(SblockHash[i][j])):
                        hashingArray = hashlib.sha256(hashingArray + str(fileNum) + SblockHash[i][j][z]).hexdigest()

            message2 = lastHash()
            message2.hash = hashingArray
            message2.nodeName = nodeName
            pub.publish(message2)
            hashingArray = ''
            time.sleep(1)
    rate.sleep()


def nodesOnline():
    global nodeONOFF
    global nodeList

    while not rospy.is_shutdown():
        var = rosnode.rosnode_ping_all()
        # print(len(var[0]))
        for i in range(len(var[0])):
            for j in range(1):
                # print(str(var[j][i])[1:6])
                if str(var[j][i])[1:6] in nodeList:
                    nodeONOFF[nodeList.index(str(var[j][i])[1:6])] = 1

        if (len(var[1])) > 1:
            for i in range(len(var[1])):
                if (var[i])[1:6] in nodeList:
                    nodeONOFF[nodeList.index(str(var[i])[1:6])] = 0

        # print(len(var[1]))
        # print(str(var[1]))
        if (len(var[1])) == 1:
            # print(str(var[1])[3:8])
            if str(var[1])[3:8] in nodeList:
                nodeONOFF[nodeList.index(str(var[1])[3:8])] = 0

        # print(nodeONOFF)
        # print(nodeList)
        time.sleep(2)


def nodeHacked1():
    global Trigger
    global nodeONOFF
    global nodeList
    global authOrderNumber
    global mostCommonHash
    global Trigger
    global authOrderNumber
    global node
    global nodeToRewrite
    global mostCommonHash
    global nodeName
    global nodeHacked
    global lNodeToRewrite
    global oldNodeHacked
    global olderNodeHacked

    counter = 0

    while not rospy.is_shutdown():

        if nodeHacked in nodeList:

            if nodeHacked in nodeList and counter == 1 and nodeONOFF[int((str(nodeHacked))[4]) - 1] == 1:

                if nodeHacked == oldNodeHacked and lNodeToRewrite == nodeHacked:
                    print(str(nodeHacked) + " has been hacked")
                    rewriteNodes()
                    counter = 0

                if nodeHacked != oldNodeHacked:
                    counter = 0

        if nodeHacked in nodeList and counter == 0 and nodeONOFF[int((str(nodeHacked))[4]) - 1] == 1:
            oldNodeHacked = nodeHacked
            counter = 1

        time.sleep(2)


def recNewData():
    rospy.Subscriber('Rewrite', rewriteNode, callbackRecData)
    rospy.spin()


def callbackRecData(data):
    global timestamp
    global block
    global SblockHash
    global Range
    global cRange
    global Rdone
    global runYet
    global nodeList
    global nodeHacked
    global stationHistory
    global REcounter
    global runYetLoc
    global logHash
    global wiped
    global blockChain
    global emit

    # 32,3,1,18:54:01 - 19/03/2019,1,211
    # 32,3,0,09:57:40 - 06/04/2019,Start production,211
    # if nodeHacked == nodeName and runYetLoc == 0 and data.fileOrArray == "file":
    #     REcounter = [0] * Range
    #     REcounter[data.carrier] = data.REcounter
    #     f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + '/' + data.fileName, "w")
    #     f.close()
    #     runYetLoc = 1
    #
    # if nodeHacked == nodeName and runYetLoc == 1 and data.fileOrArray == "file":
    #     f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + '/' + data.fileName, "a")
    #     f.write(str(data.logFile))
    #     f.close() int(int(whole[0:2]) / 10

    if wiped == True:
        nodeHacked = nodeName

    if nodeHacked == nodeName:
        if data.fileOrArray == "file":
            for i in range(int(int(data.arrayTransfer[0] + data.arrayTransfer[1]) / 10)):
                if nodeHacked == nodeName and runYetLoc == 0 and data.fileOrArray == "file":
                    f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + '/' + data.arrayTransfer[2:25],
                             "w")
                    f.close()
                    runYetLoc = 1

                if nodeHacked == nodeName and runYetLoc == 1 and data.fileOrArray == "file":
                    f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + '/' + data.arrayTransfer[2:25],
                             "a")
                    f.write(str(data.arrayTransfer[25:len(data.arrayTransfer)]))
                    f.close()

        if data.fileOrArray == "wipe":
            print("rewrite")
            wiped = True
            reInit()
            print("reInited")

        if data.fileOrArray == 'array' and data.arrayTransfer != '':

            split = data.arrayTransfer.split("?")

            for i in range(len(split)):
                try:
                    didntWork = False
                    split2 = split[i].split(';')
                    # print(split2[3])
                    order = int(split2[0])
                    carrier = int(split2[1])
                    blockNo = int(split2[2])
                    SblockTimeStamp[order][carrier][blockNo] = split2[3]
                    SblockTrans[order][carrier][blockNo] = split2[4]
                    SblockProductCode[order][carrier][blockNo] = split2[5]
                    SblockPreviousHash[order][carrier][blockNo] = split2[6]
                    Sdata[order][carrier][blockNo] = split2[7]
                    if blockNo < 7:
                        stationHistory[carrier][blockNo] = split2[8]

                except:
                    print("rewrite didn't work")
                    didntWork = True

                if didntWork == False:
                    dHour = str(SblockTimeStamp[order][carrier][blockNo].split(':')[0])
                    dMinute = str(SblockTimeStamp[order][carrier][blockNo].split(':')[1])
                    dSecond = str((SblockTimeStamp[order][carrier][blockNo].split(':')[2])[0:2])
                    dDay = str((str(SblockTimeStamp[order][carrier][blockNo].split(':')[2])[5:15]).split('/')[0])
                    dMonth = str((str(SblockTimeStamp[order][carrier][blockNo].split(':')[2])[5:15]).split('/')[1])
                    dYear = str((str(SblockTimeStamp[order][carrier][blockNo].split(':')[2])[5:15]).split('/')[2])
                    dStation = str((SblockTrans[order][carrier][blockNo]))
                    dProductCode = int(SblockProductCode[order][carrier][blockNo])

                    if dStation == "Start production":
                        stationHistory[int(carrier)][0] = str(dStation)
                        # print(data.SblockTimeStamp)
                        block[int(order)][int(carrier)][int(blockNo)] = blockChain(previousHash='',
                                                                                   station=dStation,
                                                                                   productCode=dProductCode,
                                                                                   orderNumber=order,
                                                                                   carrierID=carrier,
                                                                                   seconds=dSecond,
                                                                                   minutes=dMinute,
                                                                                   hours=dHour,
                                                                                   days=dDay,
                                                                                   months=dMonth,
                                                                                   years=dYear, data1='', data2='')

                        SblockHash[order][carrier][blockNo] = block[order][carrier][blockNo].getBlockHash()

                        data_to_print = "Time Stamp for Block: {0}\nStation: {1}\nOrder Number: {2}\nCarrierID: {3}\nProduct Code: {4}\nBlock Hash: {5}\nPrevious Hash: {6}\n{7}\n{8}".format(
                            SblockTimeStamp[order][carrier][blockNo], dStation, int(order) + 1264, carrier, int(dProductCode),
                            SblockHash[order][carrier][blockNo], '', '', '')

                    if dStation != "Start production":
                        stationHistory[int(carrier)][int(dStation)] = str(dStation)
                        print("2")
                        # print(data.SblockTimeStamp)
                        block[int(order)][int(carrier)][int(blockNo)] = blockChain(
                            previousHash=block[int(order)][int(carrier)][int(blockNo) - 1].getBlockHash(),
                            station=dStation,
                            productCode=dProductCode,
                            orderNumber=order,
                            carrierID=carrier,
                            seconds=dSecond,
                            minutes=dMinute,
                            hours=dHour,
                            days=dDay,
                            months=dMonth,
                            years=dYear, data1=Sdata[order][carrier][block].split(' ')[0], data2=Sdata[order][carrier][block].split(' ')[1])

                        SblockHash[order][carrier][blockNo] = block[order][carrier][blockNo].getBlockHash()

                        data_to_print = "Time Stamp for Block: {0}\nStation: {1}\nOrder Number: {2}\nCarrierID: {3}\nProduct Code: {4}\nBlock Hash: {5}\nPrevious Hash: {6}\n{7}\n{8}".format(
                            SblockTimeStamp[order][carrier][blockNo], dStation, int(order) + 1264, carrier, int(dProductCode),
                            SblockHash[order][carrier][blockNo],
                            block[int(order)][int(carrier)][int(blockNo) - 1].getBlockHash(), Sdata[order][carrier][block].split(' ')[0], Sdata[order][carrier][block].split(' ')[1])

                    if runYet[int(order)][int(carrier)] == '':
                        f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + "/Product" + str(
                            int(order) + 1264) + "C:" + str(
                            int(carrier)) + ".txt", "w")
                        f.close()
                        runYet[int(order)][int(carrier)] = "1"

                    if runYet[int(order)][int(carrier)] == "1":
                        f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + "/Product" + str(
                            int(order) + 1264) + "C:" + str(
                            int(carrier)) + ".txt", "a")
                        f.write(str(data_to_print))
                        f.write("\n-------------------------------\n")
                        f.close()

            fileNames = [''] * 200
            fileAmount = [''] * 200
            c = 0
            c2 = 0

            os.chdir("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName)
            for i in glob.glob("*.txt"):
                fileAmount[c2] = i
                if "Comp" in i:
                    fileNames[c] = i
                    fileNames[c] = fileNames[c].replace(".txt", "")

                    c = c + 1
                c2 = c2 + 1

            c = 0
            c2 = 0
            fileNum = fileAmount.index('')
            hashingArray = ''
            print("fileNum ", fileNum)

            for i in range(len(SblockHash)):
                for j in range(len(SblockHash[i])):
                    for z in range(len(SblockHash[i][j])):
                        if SblockHash[i][j] != '':
                            hashingArray = hashlib.sha256(hashingArray + str(fileNum) + SblockHash[i][j][z]).hexdigest()

            print(hashingArray)
            emit = True


def reInit():
    global Range
    global cRange
    global itemNumber
    global dataFollowing
    global orderNumber
    global station
    global productCode
    global block
    global blockNumber
    global orderNcarrierNumberList
    global buildBlock
    global oldData
    global emit
    global Comp
    global fCarrier
    global fOrder
    global dCounter
    global serialNumberNum
    global serialNumberStr
    global oldinfo
    global counter
    global newGenesis
    global repeat
    global newProduct
    global message
    global nodeUp
    global init
    global noGen
    global runYet
    global Trigger
    global nodeList
    global nodeONOFF
    global node
    global counter1
    global oldNodeONOFF
    global SblockTimeStamp
    global SblockProductCode
    global SblockTrans
    global Sblock
    global SblockPreviousHash
    global SblockNumber
    global SCarrierNumber
    global SblockHash
    global SOrderNumber
    global authOrderNumber
    global blockString
    global nodeHacked
    global stationHistory
    global REcounter
    global tcpOrderNumber
    global tcpCarrierNumber
    global tcpStationName
    global tcpProductCode
    global tcpYears
    global tcpMonths
    global tcpDays
    global tcpHours
    global tcpMinutes
    global tcpSeconds
    global seconds
    global minutes
    global hours
    global days
    global months
    global years
    global hashingArray
    global nodeToRewrite
    global oldNodeHacked
    global Rdone
    global logHash
    global runYetLoc
    global mostCommonHash
    global Sdata
    global tcpData1
    global tcpData2
    global camAddress

    Range = 200
    cRange = 5
    itemNumber = 0
    dataFollowing = 0
    orderNumber = 0
    station = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

    productCode = [''] * Range
    block = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

    blockNumber = 0
    orderNcarrierNumberList = [['' for _ in range(cRange)] for _ in range(Range)]

    buildBlock = 0
    oldData = ''
    emit = False
    Comp = False
    fCarrier = 0
    fOrder = 0
    dCounter = 0

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
                'NODE4', 'NODE5',
                'NODE6']  ################# IF INCLUDING MORE NODES, EXTEND THIS ARRAY SIZE #######################
    nodeONOFF = [1, 0, 0, 0]  ################# IF INCLUDING MORE NODES, EXTEND THIS ARRAY SIZE #######################
    oldNodeONOFF = [0, 0, 0, 0]  ################# IF INCLUDING MORE NODES, EXTEND THIS ARRAY SIZE #######################
    node = ['' for _ in range(20)]

    counter1 = 0;

    SblockTimeStamp = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

    SblockTrans = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

    SblockProductCode = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

    SblockHash = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

    SblockPreviousHash = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

    SblockNumber = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

    SOrderNumber = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

    SCarrierNumber = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
    Sdata = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

    Sblock = ''
    authOrderNumber = 0
    blockString = ''

    nodeHacked = ''
    stationHistory = [['' for _ in range(7)] for _ in range(5)]
    REcounter = [0] * Range

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
    tcpData1 = 0
    tcpData2 = 0

    # Class
    seconds = 0
    minutes = 0
    hours = 0
    days = 0
    months = 0
    years = 0

    # Emitter
    hashingArray = ''

    # Rewrite
    nodeToRewrite = 10
    Rdone = 0
    logHash = ''
    runYetLoc = [['' for _ in range(Range)] for _ in range(Range)]

    # authTrigger
    mostCommonHash = ''

    # camera
    camAddress = 0


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
    global nodeName

    # rewrite NODE(nodeNumber)
    pub = rospy.Publisher('Rewrite', rewriteNode, queue_size=100)

    # if nodeNumber == int(nodeName[4]) + 1 :
    # this node will rewrite the hacked node

    ########### Log file transfer ###########

    strData = ''

    print("rewrite commence")
    message3 = rewriteNode()

    fileNames = [''] * 200
    REcounter = [''] * 200
    counter = 0
    counter2 = 0
    logHash = ''
    log = ''

    os.chdir("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName)
    # print("open")
    for i in glob.glob("*.txt"):
        if "Comp" in i:
            fileNames[counter] = i
            fileNames[counter] = fileNames[counter].replace(".txt", "")
            REcounter[counter] = int(str(fileNames[counter])[18])
            counter = counter + 1

    fileNum = fileNames.index('')
    # print(fileNum)

    if fileNum > 0:
        for i in range(fileNum):
            print(fileNames[i])
            f = open(fileNames[i] + ".txt", "r")
            for j in range(32):
                logHash = logHash + f.readline()

            f.close()
            log = logHash
            message3.arrayTransfer = str(fileNum * 10) + fileNames[i] + '.txt' + log
            message3.fileOrArray = "file"
            pub.publish(message3)
            print(log)

    print("finish")
    print("wipe")

    message3.fileOrArray = 'wipe'
    message3.arrayTransfer = ''
    pub.publish(message3)
    time.sleep(5)

    ########### Live Array Transfer ###########
    print("live")
    print(stationHistory)

    for i in range(Range):
        for j in range(cRange):
            for z in range(Range):
                if SblockTimeStamp[i][j][z] != '':
                    if z < 7:
                        if stationHistory[j][z] != '':
                            strData = strData + str(i) + ';' + str(j) + ';' + str(z) + ';' + str(
                                SblockTimeStamp[i][j][z]) + ';' + str(SblockTrans[i][j][z]) + ';' + str(
                                SblockProductCode[i][j][z]) + ';' + str(SblockPreviousHash[i][j][z]) + ';' + Sdata[i][j][
                                          z] + ';' + stationHistory[j][z] + '?'
                        if stationHistory[j][z] == '':
                            strData = strData + str(i) + ';' + str(j) + ';' + str(z) + ';' + str(
                                SblockTimeStamp[i][j][z]) + ';' + str(SblockTrans[i][j][z]) + ';' + str(
                                SblockProductCode[i][j][z]) + ';' + str(SblockPreviousHash[i][j][z]) + ';' + Sdata[i][j][z] + '?'

    message3.fileOrArray = 'array'
    message3.arrayTransfer = strData
    pub.publish(message3)
    time.sleep(3)
    rate.sleep()

    print("finished")


def hackedOneTime():
    global block

    time.sleep(20)
    print("hacked")
    SblockHash[0][0][0] = "hello there"


################################# camera #################################


# def camera():
#     rospy.Subscriber('cameraData', String, camCallBack)
#     rospy.spin()
#
#
# def camCallBack(data):
#     global camAddress
#
#     # http://172.21.4.153:8000/2
#     camRaw = data.data
#     camAddress = camRaw[25]


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
    global tcpData1
    global tcpData2
    global dataFollowing
    global oldData
    global port
    global address
    global dataDes1
    global dataDes2
    global dataMag1
    global dataMag2

    # Create a TCP/IP socket
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Then bind() is used to associate the socket with the server address. In this case, the address is localhost, referring to the current server, and the port number is 10000.

    # Bind the socket to the port
    server_address = (address, port)
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
                data = connection.recv(40)

                if data:

                    if data == '                               ':
                        dataFollowing = 0
                    if data != '                                        ':
                        # example: 1,1230, 211,48, 6,18,21, 3,2019
                        # print data
                        try:
                            # print(data)
                            if oldData != data:
                                print(data)
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
                                tcpData1 = dataDes1 + str(float(data[33] + data[34] + data[35]) / dataMag1)
                                tcpData2 = dataDes2 + str(float(data[37] + data[38] + data[39]) / dataMag2)
                                dataFollowing = 1
                                mainProg()
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
        p2 = threading.Thread(target=nodeHacked1, args=())
        p3 = threading.Thread(target=authentication, args=())
        p4 = threading.Thread(target=emitter, args=())
        p5 = threading.Thread(target=hackedOneTime, args=())
        p6 = threading.Thread(target=recNewData, args=())
        p7 = threading.Thread(target=manual, args=())
        p8 = threading.Thread(target=nodesOnline, args=())
        # p9 = threading.Thread(target=camera, args=())

        p1.daemon = True
        p2.daemon = True
        p3.daemon = True
        p4.daemon = True
        p5.daemon = True
        p6.daemon = True
        p7.daemon = True
        p8.daemon = True

        p1.start()
        p2.start()
        p3.start()
        p4.start()
        p5.start()
        p6.start()
        p7.start()
        p8.start()

        p1.join()
        p2.join()
        p3.join()
        p4.join()
        p5.join()
        p6.join()
        p7.join()
        p8.join()

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


# All main blockchain code is now finished!!!! Today's date is 07/04/2019
#
# Next objectives:
#       - Make it so you can have more than products in an order.
#           - Make it so the carriages can only be recorded once at each station, so if it goes through again it won't be
#             recorded a second time.
#           - Find out what the last station is in the production line and then wipe the blockchain for that specific
#             carrier. Extend the log file's name to have completed at the end of it. Set the next product going.
#               - update rewrite function for SblockTrans and stationHistory
#       - QR Codes on casings
#           - update blockchain size
#       - Create RFID tags that can be written to when the product is completed.
#           - Possibly a webserver that has access to all the log files.

#   -Instead of the RFID, I'm going to use QR codes on the casings. Easier.
#       - Each QR code needs to have a web link that reveals the receipts.
#       - When a product is finished, the QR code is linked to a receipt on the file server which can then be scanned with an iphone.
