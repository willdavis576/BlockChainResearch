#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket




def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

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




    block = blockChain(previousHash='',
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






    

    s.connect(('127.0.0.1', 2500))
    s.sendall(block)

    s.close()



    


if __name__ == '__main__':
    main()



# THIS IS THE KEY => b4718ea7acc2e60199286959bffb58a78bb123ad6eece513123f7fc3b65149f5
