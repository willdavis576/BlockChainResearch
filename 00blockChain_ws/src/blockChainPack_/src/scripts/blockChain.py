#! /usr/bin/python
import hashlib, sys, random, rospy
from datetime import datetime
from blockChainPack_.msg import blockDetail


transactions = [['' for _ in range (100)] for _ in range (100)]
serialNumber = [''] * 100
block = [['' for _ in range (100)] for _ in range (100)]
blockNumber = 0
productNumber = 0
serialNumberNum = 0
serialNumberStr = 'PRODUCT'
oldinfo = ''
counter = 0
newGenesis = 1
repeat = 0
newProduct = ''

class blockChain:
    
    def __init__(self, previousHash, transactions, serialNumber):
        self.timeStamp = datetime.now()
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

   
def blockUpdate(blockNumber, productNumber, transactions, serialNumber):
    #Generic Blocks after Genesis Block
    for i in range(blockNumber , blockNumber + 1):
        blockNumber = i
        block[blockNumber][productNumber] = blockChain(previousHash = block[blockNumber-1][productNumber].getBlockHash(), transactions = transactions, serialNumber = serialNumber)
        print(block[blockNumber][productNumber].getBlockHash())

def main():
    while(newProduct != "n"):
        mainProg()

	
def mainProg():
    global blockNumber
    global productNumber
    global serialNumberNum
    global serialNumberStr
    global oldinfo
    global counter
    global newGenesis
    global repeat
    global newProduct

    
    while(newGenesis == 1):
            #Setup for genesis block
            repeat = 0
            serialNumberNum = productNumber
            serialNumber[productNumber] = serialNumberStr + str(serialNumberNum)

            #Genesis Block    
            block[blockNumber][productNumber] = blockChain(previousHash = '', transactions = "Start production", serialNumber = serialNumber[productNumber])
            print(block[blockNumber][productNumber].getBlockHash())
            blockNumber = blockNumber + 1 #key part, as each station uploads information, this variable is incremented to generate a new block
        
            newGenesis = 0
            break
 
    while(True):
	pub = rospy.Publisher('publishingBlockStream', blockDetail, queue_size=1)
        rospy.init_node('publishBlock', anonymous=False)
        rate = rospy.Rate(10) # 10hz
        var = raw_input("What stage of the production line? ")
        if var == "finish":
            newProduct = raw_input("New product? y/n ")
            if newProduct == "y":
                blockNumber = 0
                newGenesis = 1
                repeat = 1
            if newProduct == "n":
                break
            else:
                break
        var2 = raw_input("part number (if applies)? ")
        if var2 == "":
            var2 = "N/A"
        info = var + " stage - Part Number (if applicable): " + var2
        
        if oldinfo != info:
            transactions[blockNumber][productNumber] = info
            serialNumberNum = productNumber
            serialNumber[productNumber] = serialNumberStr + str(serialNumberNum)
            #this gets called everytime there is new data
            blockUpdate(blockNumber, productNumber, transactions = transactions[blockNumber][productNumber], serialNumber = serialNumber[productNumber])
            print(block[blockNumber][productNumber].getTransactions())
            print(str(blockNumber) + " " + str(productNumber))
	    
	    #publish data to ROS
	    #rospy.loginfo(str(pBlockNumber), " ", str(pPartNumber)) #show on terminal
	    message = blockDetail()
	    message.blockNumber = blockNumber
	    message.productNumber = productNumber
            pub.publish(message) #(productNumber)) #publish to publisher
            blockNumber = blockNumber + 1
            counter = counter + 1
            oldinfo = info

    
    
    #now there is 10 bits of information, go back and show history.
    for i in range (0, productNumber + 1):
        for j in range (0, blockNumber):
            print(str(j) + " " + block[j][i].getTransactions() + " at time: " + str(block[j][i].getTimeStamp()))
        print(block[0][i].getSerialNumber())
    if repeat == 1:
        productNumber = productNumber + 1

if __name__ == '__main__':
        main()
       


    #each stage of the production line needs to log:

#	- time => DONE!
#	- part number used => DONE!
#	- current product number => DONE!
#	- what stage of production line => DONE!

#this means I need an array of blockchains. One blockchain for one product => DONE!


    #targets for tomorrow and Tuesday:

#   - broadcast onto another node (computer)
#   - use blockchain authentiation to validate data
