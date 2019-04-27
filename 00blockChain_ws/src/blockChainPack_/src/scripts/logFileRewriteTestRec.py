#! /usr/bin/python
import hashlib, sys, random, rospy, os, glob, time
from datetime import datetime
from blockChainPack_.msg import blockDetail
from blockChainPack_.msg import rewriteNode
import threading

logHash2 = ''
nodeName = "NODE4_Hacked"
Range = 200
logHash = ''
runYetLoc = 0
def main():
    rospy.Subscriber('Rewrite', rewriteNode, callback)
    rospy.spin()


def callback(data):
    pub = rospy.Publisher('Rewrite', rewriteNode, queue_size=100)
    global nodeName
    global Range
    global runYetLoc
    global logHash2
    print(data.logFile)
    # dataSplit = data.arrayTransfer.split(",")

    # dOrder = int(dataSplit[0])
    # dCarrier = int(dataSplit[1])
    # dBlock = int(dataSplit[2])
    # dHour = str((dataSplit[3])[0] + (dataSplit[3])[1])
    # dMinute = str((dataSplit[3])[3] + (dataSplit[3])[4])
    # dSecond = str((dataSplit[3])[6] + (dataSplit[3])[7])
    # dDay = str((dataSplit[3])[11] + (dataSplit[3])[12])
    # dMonth = str((dataSplit[3])[14] + (dataSplit[3])[15])
    # dYear = str((dataSplit[3])[17] + (dataSplit[3])[18] + (dataSplit[3])[19] + (dataSplit[3])[20])
    # dStation = dataSplit[4]
    # dProductCode = int(dataSplit[5])


    # 32,3,1,18:54:01 - 19/03/2019,1,211
    # 32,3,0,09:57:40 - 06/04/2019,Start production,211
    if "NODE2" == "NODE2" and runYetLoc == 0:
        REcounter = [0] * Range
        REcounter[data.carrier] = data.REcounter
        f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + '/' + data.fileName, "w")
        f.close()
        runYetLoc = 1

    if "NODE2" == "NODE2" and runYetLoc == 1:
        f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + '/' + data.fileName, "a")
        f.write(str(data.logFile))
        f.close()

    # f = open("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName + '/' + data.fileName, "r")
    # for j in range(32):
    #     logHash = logHash + f.readline()






if __name__ == '__main__':
    rospy.init_node('testingBlock', anonymous="True")
    main()