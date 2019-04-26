#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket
from datetime import datetime
from collections import Counter
from blockChainPack_.msg import rewriteNode
Range = 200
cRange = 4
timestamp = [[['a' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]






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
    pub = rospy.Publisher('Rewrite', rewriteNode, queue_size=100)

    while not rospy.is_shutdown():
        message3 = rewriteNode()
        message3.SblockTimeStamp = "#3230?22:53:53 - 05/04/2019,#3231?18:54:01 - 19/03/2019,#3231?22:53:53 - 05/04/2019,#3231?18:54:01 - 19/03/2019,#3232?22:53:53 - 05/04/2019,#3231?18:54:01 - 19/03/2019,"
        message3.SblockTrans = "#3230?Start production,#3231?1,#3231?2,#3231?3,"
        message3.SblockProductCode = "#3230?211,#3231?211,#3232?211,"
        # message3.SblockHash = strBlockHash
        # message3.SblockPreviousHash = strBlockPreviousHash
        message3.SCarrierNumber = "#3230?1,#3230?2,#3230?3,"
        pub.publish(message3)
        time.sleep(1)




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
