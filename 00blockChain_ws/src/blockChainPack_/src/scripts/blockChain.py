#! /usr/bin/python
import hashlib, sys, random, rospy
from datetime import datetime
from blockChainPack_.msg import blockDetail

transactions = [['' for _ in range(100)] for _ in range(100)]
serialNumber = [''] * 100
block = [['' for _ in range(100)] for _ in range(100)]
blockNumber = 0
productNumber = 0
serialNumberNum = 0
serialNumberStr = 'PRODUCT'
oldinfo = ''
counter = 0
newGenesis = 1
repeat = 0
newProduct = ''
message = ''


class blockChain:

    def __init__(self, previousHash, transactions, serialNumber):
        self.timeStamp = datetime.now()
        self.serialNumber = serialNumber
        self.previousHash = previousHash
        self.transactions = transactions
        self.contains = hashlib.sha256(self.transactions.encode()).hexdigest() + previousHash + str(
            self.timeStamp) + self.serialNumber
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
    for i in range(blockNumber, blockNumber + 1):
        blockNumber = i
        block[blockNumber][productNumber] = blockChain(
            previousHash=block[blockNumber - 1][productNumber].getBlockHash(), transactions=transactions,
            serialNumber=serialNumber)
        print(block[blockNumber][productNumber].getBlockHash())


def sendMessage():
    global message
    message = blockDetail()
    message.blockNumber = blockNumber
    message.productNumber = productNumber
    message.timeStamp = str(block[blockNumber][productNumber].getTimeStamp())
    message.transactions = block[blockNumber][productNumber].getTransactions()
    message.serialNumber = block[blockNumber][productNumber].getSerialNumber()
    message.blockHash = block[blockNumber][productNumber].getBlockHash()
    message.previousHash = block[blockNumber][productNumber].getPreviousHash()


def main():
    while (True):
        while not rospy.is_shutdown():
            while (newProduct != "n"):
                mainProg()
        if rospy.is_shutdown():
            break


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
    global message

    while (newGenesis == 1):
        # Setup for genesis block
        repeat = 0
        serialNumberNum = productNumber
        serialNumber[productNumber] = serialNumberStr + str(serialNumberNum)

        # Genesis Block
        block[blockNumber][productNumber] = blockChain(previousHash='', transactions="Start production",
                                                       serialNumber=serialNumber[productNumber])
        print("genesis: ")
        print(block[blockNumber][productNumber].getBlockHash())
        pub = rospy.Publisher('publishingBlockStream', blockDetail, queue_size=1)
        rospy.init_node('publishBlock', anonymous="True")
        sendMessage()
        pub.publish(message)
        blockNumber = blockNumber + 1  # key part, as each station uploads information, this variable is incremented to generate a new block
        newGenesis = 0
        break

    while (True):
        pub = rospy.Publisher('publishingBlockStream', blockDetail, queue_size=1)
        rospy.init_node('publishBlock', anonymous="True")
        rate = rospy.Rate(10)  # 10hz
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
            blockUpdate(blockNumber, productNumber, transactions=transactions[blockNumber][productNumber],
                        serialNumber=serialNumber[productNumber])
            print(block[blockNumber][productNumber].getTransactions())
            print(str(blockNumber) + " " + str(productNumber))
            sendMessage()
            pub.publish(message)
            blockNumber = blockNumber + 1
            counter = counter + 1
            oldinfo = info


    for i in range(0, productNumber + 1):
        for j in range(0, blockNumber):
            print(str(j) + " " + block[j][i].getTransactions() + " at time: " + str(block[j][i].getTimeStamp()))
        print(block[0][i].getSerialNumber())

    if repeat == 1:
        productNumber = productNumber + 1

if __name__ == '__main__':
    main()

# each stage of the production line needs to log:

#	- time => DONE!
#	- part number used => DONE!
#	- current product number => DONE!
#	- what stage of production line => DONE!

# this means I need an array of blockchains. One blockchain for one product => DONE!


# targets for tomorrow and Tuesday:

#   - broadcast onto another node (computer) => DONE!
#   - Make all nodes have the same data saved to text files => DONE(ish)!
#   - Fix bug with only the initial roslaunch receiving the first genesis block data. The rest of the nodes don't receive it, currently
#   - use blockchain authentiation to validate data

# Authentication ideas:
#	- new script and stream for ask all nodes to do an authentication check
# 	- possibley all nodes remake their blocks and send their hashes to every other node. 
#	- every other node will listen for other nodes' blockchains and the node names and create an array.
# 	- if any of the hashes are different are different, that node will be deactivated.
