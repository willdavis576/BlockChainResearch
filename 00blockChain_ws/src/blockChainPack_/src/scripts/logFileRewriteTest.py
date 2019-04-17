#! /usr/bin/python
import hashlib, sys, random, rospy, os, glob, time
from datetime import datetime
from blockChainPack_.msg import blockDetail
from blockChainPack_.msg import rewriteNode
import threading



def main():
    pub = rospy.Publisher('Rewrite', rewriteNode, queue_size=100)
    nodeName = "NODE2"
    # if nodeNumber == int(nodeName[4]) + 1 :
    # this node will rewrite the hacked node

    ########### Log file transfer ###########

    strData = ''

    print("rewrite commence")
    message3 = rewriteNode()

    # TimeStamp
    fileNames = [''] * 200
    REcounter = [''] * 200
    counter = 0
    counter2 = 0
    logHash = ''

    os.chdir("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_" + nodeName)
    print("open")
    for i in glob.glob("*.txt"):
        if "Comp" in i:
            fileNames[counter] = i
            fileNames[counter] = fileNames[counter].replace(".txt", "")
            REcounter[counter] = int(str(fileNames[counter])[18])
            counter = counter + 1

    fileNum = fileNames.index('')
    print(fileNum)


    for i in range(fileNum):
        print(fileNames[i])
        f = open(fileNames[i] + ".txt", "r")
        for j in range(32):
            logHash = logHash + f.readline()
        f.close()
        logHash = hashlib.sha256(logHash.encode()).hexdigest()
        print(logHash)

        f = open(fileNames[i] + ".txt", "r")
        for z in range(32):
            message3 = rewriteNode()
            time.sleep(0.1)
            message3.REcounter = REcounter[i]
            message3.fileName = fileNames[i]
            message3.logFile = f.readline()
            message3.done = 0
            # message3.arrayTransfer = ''
            message3.logHash = logHash
            pub.publish(message3)
            time.sleep(0.1)

        print("finish")




if __name__ == '__main__':
    rospy.init_node('testingBlock', anonymous="True")
    main()