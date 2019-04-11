#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket
from datetime import datetime
from collections import Counter
from blockChainPack_.msg import rewriteNode

Range = 200
cRange = 4
timestamp = [[['a' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
block = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
SblockHash = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]

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
    rospy.Subscriber('Rewrite', rewriteNode, callback)
    rospy.spin()


def callback(data):
    global timestamp
    global block
    global SblockHash

    # 32,3,1,18:54:01 - 19/03/2019,1,211
    # 32,3,0,09:57:40 - 06/04/2019,Start production,211

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

    if dStation == "Start production":
        # print("1")
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
        # print("2")
        # print(data.SblockTimeStamp)
        block[int(dOrder)][int(dCarrier)][int(dBlock)] = blockChain(previousHash=block[int(dOrder)][int(dCarrier)][int(dBlock)-1].getBlockHash(),
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

        hashingArray = ''

        for i in range(len(SblockHash)):
            for j in range(len(SblockHash[i])):
                for z in range(len(SblockHash[i][j])):
                    hashingArray = hashlib.sha256(hashingArray + SblockHash[i][j][z]).hexdigest()

        print(hashingArray)


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
