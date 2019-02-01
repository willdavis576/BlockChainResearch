#!/usr/bin/env python
import rospy, hashlib
from blockChainPack_.msg import blockDetail

transactions = [['' for _ in range (100)] for _ in range (100)]
block = [['' for _ in range (100)] for _ in range (100)]
serialNumber = [''] * 100
block = [['' for _ in range (100)] for _ in range (100)]
blockNumber = 0
productNumber = 0
timeStamp = 0

def callback(data):
    global blockNumber
    global productNumber
    global timeStamp
    global transactions
    global serialNumber

    data_to_print = "I heard\nTime Stamp for Block: {0}\nTransactions: {1}\nSerial Number: {2}\nBlockHash: {3}\nPreviousHash: {4}".format(data.timeStamp, data.transactions, data.serialNumber, data.blockHash, data.previousHash)

    rospy.loginfo(data_to_print)
  
    block[blockNumber][productNumber] = blockChain(previousHash = data.previousHash, transactions = data.transactions, serialNumber = data.serialNumber, timeStamp = data.timeStamp)

    #print(block[blockNumber][productNumber].getPreviousHash() + " " + block[blockNumber][productNumber].getTransactions() + " " + block[blockNumber][productNumber].getSerialNumber() + " " + block[blockNumber][productNumber].getTimeStamp() + " " + block[blockNumber][productNumber].getBlockHash())

    
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

    rospy.init_node('listener', anonymous=False)

    rospy.Subscriber('publishingBlockStream', blockDetail, callback)
  

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()

