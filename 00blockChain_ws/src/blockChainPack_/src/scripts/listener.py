#!/usr/bin/env python
import rospy, hashlib, time
from blockChainPack_.msg import blockDetail

transactions = [['' for _ in range (100)] for _ in range (100)]
block = [['' for _ in range (100)] for _ in range (100)]
serialNumber = [''] * 100
block = [['' for _ in range (100)] for _ in range (100)]
blockNumber = 0
productNumber = 0
timeStamp = 0
runYet = [''] * 100

def callback(data):
    global blockNumber
    global productNumber
    global timeStamp
    global transactions
    global serialNumber

    productNumber = data.productNumber
    data_to_print = "Time Stamp for Block: {0}\nTransactions: {1}\nSerial Number: {2}\nBlockHash: {3}\nPreviousHash: {4}".format(data.timeStamp, data.transactions, data.serialNumber, data.blockHash, data.previousHash)
    rospy.loginfo(data_to_print)
    if runYet[productNumber] == '':
        f = open("blockChain" + str(productNumber) + ".txt", "w")
        time.sleep(10)
        f.close()
        runYet[productNumber] = "1"
    if runYet[productNumber] == "1":
        f = open("blockChain" + str(productNumber) + ".txt", "a")
        time.sleep(10)
        f.write(str(data_to_print))
        f.write("\n-------------------------------\n")
        f.close()

    #rospy.loginfo(data_to_print)
  
    block[blockNumber][productNumber] = blockChain(previousHash = data.previousHash, transactions = data.transactions, serialNumber = data.serialNumber, timeStamp = data.timeStamp)
    
    contains = hashlib.sha256(data.transactions.encode()).hexdigest() + data.previousHash + str(data.timeStamp) + data.serialNumber
    #print(hashlib.sha256(contains.encode()).hexdigest())


class blockChain:

    def __init__(self, previousHash, transactions, serialNumber, timeStamp):
        self.timeStamp = timeStamp
        self.serialNumber = serialNumber
        self.previousHash = previousHash
        self.transactions = transactions
        self.contains = hashlib.sha256(self.transactions.encode()).hexdigest() + previousHash + str(self.timeStamp) + self.serialNumber
        self.blockHash = hashlib.sha256(self.contains.encode()).hexdigest()

    def getTimeStamp(self):
        return self.timeStamp

    def getBlockHash(self):
        return self.blockHash

    def getPreviousHash(self):
        return self.previousHash

    def getTransactions(self):
        return self.transactions

    def getSerialNumber(self):
        return self.serialNumber

def listener():
    rospy.Subscriber('publishingBlockStream', blockDetail, callback)
    rospy.spin()

if __name__ == '__main__':
    rospy.init_node('listener', anonymous=True)
    listener()

