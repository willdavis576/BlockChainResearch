import hashlib, sys

#previousHash = '' 
#just copying data for now

transactions = [''] * 100
block = [None] * 100

class blockChain:
    
	#prev hash
	#current data
	#timestamp
    def __init__(self, previousHash, transactions):
        self.previousHash = previousHash
        self.transactions = transactions
        self.contains = hashlib.sha256(self.transactions.encode()).hexdigest() + previousHash
        self.blockHash = hashlib.sha256(self.contains.encode()).hexdigest()
 
    def getBlockHash(self):
        return self.blockHash
        
    def getPreviousHash(self):
        return self.previousHash

    def getTransactions(self):
        return self.transactions

def blockUpdate(blockNumber, transactions):
    #Generic Blocks after Genesis Block
    for i in range(blockNumber , blockNumber + 1):
        blockNumber = i
        block[blockNumber] = blockChain(previousHash = block[blockNumber-1].getBlockHash(), transactions = transactions)
        print(block[blockNumber].getBlockHash())

def main():
    blockNumber = 0
    oldvar = ''
    counter = 0
    #Genesis Block    
    block[blockNumber] = blockChain(previousHash = '', transactions = transactions[blockNumber])
    print(block[blockNumber].getBlockHash())
    blockNumber = blockNumber + 1 #key part, as each station uploads information, this variable is incremented to generate a new block
 
    while(counter < 11):
        var = input("What data do you want? ")
        print(counter)
        if oldvar != var:
            transactions[blockNumber] = var
            #this gets called everytime there is new data
            blockUpdate(blockNumber, transactions = transactions[blockNumber])
            print(block[blockNumber].getTransactions())
            blockNumber = blockNumber + 1
            counter = counter + 1
            oldvar = var
    
    #now there is 10 bits of information, go back and show history.
    for i in range (0, blockNumber):
        print(block[i].getTransactions())


if __name__ == '__main__':
	main()


    #each stage of the production line needs to log:

#	- time
#	- part number used
#	- current product number 
#	- what stage of production line

#this means I need an array of blockchains. One blockchain for one product