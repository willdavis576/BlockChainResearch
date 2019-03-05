#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time
from datetime import datetime
from collections import Counter
from blockChainPack_.msg import blockDetail
from blockChainPack_.msg import lastHash


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
nodeUp = ''
init = 0
noGen = 0
runYet = [''] * 100
Trigger = False
nodeList = ['NODE1', 'NODE2', 'NODE3']
nodeONOFF = [1,0,0]
oldNodeONOFF = [0,0,0]
node = [['' for _ in range(100)] for _ in range(100)]

nodeName = "NODE2" ############### THIS IS WHERE YOU SPECIFY A NODE'S NAME #######################


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
        block[productNumber][blockNumber] = blockChain(
            previousHash=block[productNumber][blockNumber - 1].getBlockHash(), transactions=transactions,
            serialNumber=serialNumber)
        print(block[productNumber][blockNumber].getBlockHash())


def sendMessage():
    global message
    message = blockDetail()
    message.blockNumber = blockNumber
    message.productNumber = productNumber
    message.timeStamp = str(block[productNumber][blockNumber].getTimeStamp())
    message.transactions = block[productNumber][blockNumber].getTransactions()
    message.serialNumber = block[productNumber][blockNumber].getSerialNumber()
    message.blockHash = block[productNumber][blockNumber].getBlockHash()
    message.previousHash = block[productNumber][blockNumber].getPreviousHash()


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
    global nodeName
    global nodeUp

    pub = rospy.Publisher('publishingBlockStream', blockDetail, queue_size=1)

    while (newGenesis == 1):
        # Setup for genesis block
        repeat = 0
        serialNumberNum = productNumber
        serialNumber[productNumber] = serialNumberStr + str(serialNumberNum)

        # Genesis Block
        block[productNumber][blockNumber] = blockChain(previousHash='', transactions="Start production",
                                                       serialNumber=serialNumber[productNumber])
        print("genesis: ")
        print(block[productNumber][blockNumber].getBlockHash())
        sendMessage()
        pub.publish(message)
        newGenesis = 0
        blockNumber = blockNumber + 1  # key part, as each station uploads information, this variable is incremented to generate a new block
        break

    while (True):
        #pub = rospy.Publisher('publishingBlockStream', blockDetail, queue_size=1)

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
            transactions[productNumber][blockNumber] = info
            serialNumberNum = productNumber
            serialNumber[productNumber] = serialNumberStr + str(serialNumberNum)
            blockUpdate(blockNumber, productNumber, transactions=transactions[productNumber][blockNumber],
                        serialNumber=serialNumber[productNumber])
            # print(block[blockNumber][productNumber].getTransactions())
            # print(str(blockNumber) + " " + str(productNumber))
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


def listener():
    rospy.Subscriber('publishingBlockStream', blockDetail, callback)
    rospy.spin()


def callback(data):
    global runYet
    productNumber1 = data.productNumber
    data_to_print = "Time Stamp for Block: {0}\nTransactions: {1}\nSerial Number: {2}\nBlockHash: {3}\nPreviousHash: {4}".format(
        data.timeStamp, data.transactions, data.serialNumber, data.blockHash, data.previousHash)
    # rospy.loginfo(data_to_print)
    if runYet[productNumber1] == '':
        f = open("/home/ros/blockChainGit/00blockChain_ws/blockChain" + str(productNumber1) + ".txt", "w")
        f.close()
        runYet[productNumber1] = "1"

    if runYet[productNumber1] == "1":
        f = open("/home/ros/blockChainGit/00blockChain_ws/blockChain" + str(productNumber1) + ".txt", "a")
        f.write(str(data_to_print))
        f.write("\n-------------------------------\n")
        f.close()

def authentication():
    rospy.Subscriber('Last_Hash', lastHash, callbackAuth)
    rospy.spin()

def callbackAuth(data):
    global nodeONOFF
    global nodeList
    if data.nodeName in nodeList:
        nodeONOFF[nodeList.index(data.nodeName)] = 1 #filling in the online array
    for i in range(10): #10 being a max node amount - can be changed as the array size is 100
        name = data.nodeName
        node[int(name[4])][data.productNumber] = data.hash

    #print(nodeONOFF)

def emitter():
    global productNumber
    global blockNumber
    global Trigger
    global transactions

    while not rospy.is_shutdown():
        # if Trigger == False:
        #     nodeUp = rospy.Publisher('Last_Hash', lastHash, queue_size=1)
        #     message2 = lastHash()
        #     message2.nodeName = nodeName
        #     nodeUp.publish(message2)
        #     time.sleep(1)

        # if Trigger == True:
            for i in range(productNumber + 1):
                pub = rospy.Publisher('Last_Hash', lastHash, queue_size=1)
                message2 = lastHash()
                message2.nodeName = "NODE2"
                message2.productNumber = i
                message2.hash = block[i][block[i].index('', 1) - 1].getBlockHash()
                pub.publish(message2)
                time.sleep(1)

    #rospy.spin()
#
# def authTrigger():
#     global Trigger
#     time.sleep(10)
#     Trigger = True
#     time.sleep(1)
#     Trigger = False

if __name__ == '__main__':
    rospy.init_node('publishBlock', anonymous="True")
    p1 = threading.Thread(target=listener, args=())
    p2 = threading.Thread(target=main, args=())
    p3 = threading.Thread(target=authentication, args=())
    p4 = threading.Thread(target=emitter, args=())

    p1.daemon = True
    p2.daemon = True
    p3.daemon = True
    p4.daemon = True

    p1.start()
    p2.start()
    p3.start()
    p4.start()

    p1.join()
    p2.join()
    p3.join()
    p4.join()


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
