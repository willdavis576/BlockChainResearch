import hashlib, sys, random
from datetime import datetime

#previousHash = '' 
#just copying data for now

transactions = [''] * 100
serialNumber = [''] * 100
block = [None] * 100

class blockChain:
    
	#prev hash
	#current data
	#timestamp
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
        block[[blockNumber][productNumber]] = blockChain(previousHash = block[[blockNumber-1][productNumber]].getBlockHash(), transactions = transactions, serialNumber = serialNumber)
        print(block[[blockNumber][productNumber]].getBlockHash())

def main():
    blockNumber = 0
    productNumber = 0
    serialNumberNum = 0
    serialNumberStr = 'PRODUCT'
    oldinfo = ''
    counter = 0
    
    #Setup for genesis block
    serialNumberNum = blockNumber
    serialNumber[[blockNumber][productNumber]] = serialNumberStr + str(serialNumberNum)

    #Genesis Block    
    block[[blockNumber][productNumber]] = blockChain(previousHash = '', transactions = "Start production", serialNumber = serialNumber[[blockNumber][productNumber]])
    print(block[[blockNumber][productNumber]].getBlockHash())
    blockNumber = blockNumber + 1 #key part, as each station uploads information, this variable is incremented to generate a new block
 
    while(counter < 4):
        var = input("What stage of the production line? ")
        var2 = input("part number (if applies)? ")
        if var2 == "":
            var2 = "N/A"
        info = var + " stage - Part Number (if applicable): " + var2
        print(counter)
        if oldinfo != info:
            transactions[[blockNumber][productNumber]] = info
            serialNumberNum = productNumber
            serialNumber[[blockNumber][productNumber]] = serialNumberStr + str(serialNumberNum)
            #this gets called everytime there is new data
            blockUpdate(blockNumber, productNumber, transactions = transactions[[blockNumber][productNumber]], serialNumber = serialNumber[[blockNumber][productNumber]])
            print(block[[blockNumber][productNumber]].getTransactions())
            blockNumber = blockNumber + 1
            counter = counter + 1
            oldinfo = info
    
    #now there is 10 bits of information, go back and show history.
    for i in range (0, blockNumber):
        print(str(i) + " " + block[[i][0]].getTransactions() + " at time: " + str(block[[i][0]].getTimeStamp()))

    print(block[[blockNumber-1][productNumber]].getSerialNumber())

if __name__ == '__main__':
	main()


    #each stage of the production line needs to log:

#	- time => DONE!
#	- part number used => DONE!
#	- current product number => DONE!
#	- what stage of production line => DONE!

#this means I need an array of blockchains. One blockchain for one product