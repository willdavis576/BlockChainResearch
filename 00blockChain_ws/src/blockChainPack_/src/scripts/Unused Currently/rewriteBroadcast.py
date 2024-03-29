#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket, os, glob, rosnode
from datetime import datetime
from collections import Counter
from blockChainPack_.msg import rewriteNode
from std_msgs.msg import String
from bondpy import bondpy

Range = 200
cRange = 5
timestamp = [[['a' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
SblockTimeStamp = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
SblockTrans = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
SblockProductCode = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
block = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
block2 = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]


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


def main():
    pub = rospy.Publisher('Rewrite', String, queue_size=100)

    # while not rospy.is_shutdown():
    #     string = ''
    #
    #     for i in range(200):
    #         for j in range(4):
    #             for z in range(200):
    #                 string = string + timestamp[i][j][z]
    #
    #     pub.publish((string))

    # fileNames = [''] * 200
    # REcounter = [''] * 200
    # counter = 0
    # counter2 = 0
    # logHash = ''
    # log = ''
    #
    # os.chdir("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_NODE1")
    # print("open")
    # for i in glob.glob("*.txt"):
    #     if "Comp" in i:
    #         fileNames[counter] = i
    #         fileNames[counter] = fileNames[counter].replace(".txt", "")
    #         REcounter[counter] = int(str(fileNames[counter])[18])
    #         counter = counter + 1
    #
    # fileNum = fileNames.index('')
    # print(fileNum)
    #
    # for i in range(fileNum):
    #     print(fileNames[i])
    #     f = open(fileNames[i] + ".txt", "r")
    #     for j in range(32):
    #         logHash = logHash + f.readline()
    #
    #     f.close()
    #     log = logHash
    #     whole = str(fileNum * 10) + fileNames[i] + '.txt' + log
    #     pub.publish(whole)
    #     print(len(whole))
    #
    #     # print(whole[0:23])
    #     # print(whole.split(fileNames[i] + '.txt'))
    #     # print(whole)
    #     # logHash = hashlib.sha256(logHash.encode()).hexdigest()
    #     # print(logHash)
    #
    #     f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_NODE3/" + whole[2:25], "w")
    #     f.close()
    #     f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_NODE3/" + whole[2:25], "a")
    #     f.write(whole[25:len(whole)])
    #     print(whole[25:len(whole)])
    #     print(int(int(whole[0:2]) / 10))
    #     f.close()

    # f = open(fileNames[i] + ".txt", "r")
    # for z in range(32):
    #     message3 = rewriteNode()
    #     time.sleep(0.1)
    #     message3.REcounter = REcounter[i]
    #     message3.fileName = fileNames[i]
    #     message3.logFile = f.readline()
    #     message3.done = 0
    #     # message3.arrayTransfer = ''
    #     message3.logHash = logHash
    #     message3.fileOrArray = "file"
    #     pub.publish(message3)
    #     time.sleep(0.1)
    global SblockTimeStamp
    global SblockTrans
    global SblockProductCode
    counter = 0
    strData = ''
    #
    # for i in range(20):
    #     for j in range(4):
    #         for z in range(20):
    #             if j != 0:
    #                 SblockTimeStamp[i][j+1][z] = str(datetime.now())
    #                 SblockProductCode[i][j+1][z] = 211
    #                 SblockTrans[i][j+1][z] = counter
    #                 if counter == 4:
    #                     counter = 0
    #                 counter = counter + 1
    # #
    # var = raw_input("ye?")
    # if var == 'y':
    #     hashing = ''
    #     for i in range(Range):
    #         for j in range(4):
    #             for z in range(Range):
    #                 if SblockTimeStamp[i][j+1][z] != '':
    #                     if j != 0:
    #                         strData = strData + str(i) + ';' + str(j+1) + ';' + str(z) + ';' + str(SblockTimeStamp[i][j+1][z]) + ';' + str(SblockTrans[i][j+1][z]) + ';' + str(SblockProductCode[i][j+1][z]) + '?'
    #                         hashing = hashlib.sha256(hashing + str(i) + ';' + str(j+1) + ';' + str(z) + ';' + str(SblockTimeStamp[i][j+1][z]) + ';' + str(SblockTrans[i][j+1][z]) + ';' + str(SblockProductCode[i][j+1][z]) + '?').hexdigest()
    #
    # arrayTransfer = strData
    # print(hashing)
    # hashing = ''
    #
    # #0;2;0;2019-04-29 00:22:56.699160;0;211
    #
    # split = arrayTransfer.split("?")
    #
    # for i in range (len(split)):
    #     try:
    #         split2 = split[i].split(';')
    #         order = int(split2[0])
    #         carrier = int(split2[1])
    #         block = int(split2[2])
    #         SblockTimeStamp[order][carrier][block] = split2[3]
    #         SblockTrans[order][carrier][block] = split2[4]
    #         SblockProductCode[order][carrier][block] = split2[5]
    #     except:
    #         ye = "man"
    #
    #
    #
    #
    #
    # for i in range(Range):
    #     for j in range(4):
    #         for z in range(Range):
    #             if SblockTimeStamp[i][j + 1][z] != '':
    #                 if j != 0:
    #                     strData = strData + str(i) + ';' + str(j + 1) + ';' + str(z) + ';' + str(
    #                         SblockTimeStamp[i][j + 1][z]) + ';' + str(SblockTrans[i][j + 1][z]) + ';' + str(
    #                         SblockProductCode[i][j + 1][z]) + '?'
    #                     hashing = hashlib.sha256(hashing + str(i) + ';' + str(j + 1) + ';' + str(z) + ';' + str(
    #                         SblockTimeStamp[i][j + 1][z]) + ';' + str(SblockTrans[i][j + 1][z]) + ';' + str(
    #                         SblockProductCode[i][j + 1][z]) + '?').hexdigest()

    # print(hashing)
    # nodeList = ['Node1', 'Node2', 'Node3']
    # nodeONOFF = [0,0,0]
    # # # print(rosnode.get_node_names())
    # # print(rosnode.rosnode_ping_all())
    # #
    # # var = rosnode.rosnode_ping_all()
    # # print(var[0][0])
    # while not rospy.is_shutdown():
    #     var = rosnode.rosnode_ping_all()
    #     # print(len(var[0]))
    #     for i in range(len(var[0])):
    #         for j in range(1):
    #             # print(str(var[j][i])[1:6])
    #             if str(var[j][i])[1:6] in nodeList:
    #                 nodeONOFF[nodeList.index(str(var[j][i])[1:6])] = 1
    #
    #     if (len(var[1])) > 1:
    #         for i in range(len(var[1])):
    #             if (var[i])[1:6] in nodeList:
    #                 nodeONOFF[nodeList.index(str(var[i])[1:6])] = 0
    #
    #     print(len(var[1]))
    #     # print(str(var[1]))
    #     if (len(var[1])) == 1:
    #         print(str(var[1])[3:8])
    #         if str(var[1])[3:8] in nodeList:
    #             nodeONOFF[nodeList.index(str(var[1])[3:8])] = 0
    #
    #     print(nodeONOFF)
    #     time.sleep(2)

    block[2][4][0] = blockChain(previousHash='',
                                station="1",
                                productCode="211",
                                orderNumber="2",
                                carrierID="4",
                                seconds="10",
                                minutes="10",
                                hours="18",
                                days="27",
                                months="03",
                                years="2019")
    print("ye")
    print(block[2][4][0])
    print(block[2][4][0].getBlockHash())
    block2[2][4][0] = block[2][4][0]

    print(block2[2][4][0].getBlockHash())

    while not rospy.is_shutdown():
        pub.publish(block[2][4][0])


if __name__ == '__main__':
    rospy.init_node('testRewrite', anonymous="True")
    rate = rospy.Rate(10)
    main()

    # ---
    # SblockTimeStamp: "#3230?22:53:53 - 05/04/2019,#3231?18:54:01 - 19/03/2019,"
    # SblockTrans: "#3230?Start production,#3231?1,"
    # SblockProductCode: "#3230?211,"
    # SCarrierNumber: "#3230?1,"
    # ---
