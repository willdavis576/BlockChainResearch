#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time
from datetime import datetime
from collections import Counter
from blockChainPack_.msg import blockDetail
from blockChainPack_.msg import lastHash

Range = 200
cRange = 4
SblockHash = [[['' for _ in range(Range)] for _ in range(cRange)] for _ in range(Range)]
counter = 0
hashingArray = ''

def mixer():
    global counter
    for i in range (150):
        for j in range (3):
            for z in range(150):
                SblockHash[i][j][z] = hashlib.sha256(("Hello World" + str(counter)).encode()).hexdigest()
                counter = counter + 1
    print("done")

def main():
    global hashingArray
    global SblockHash
    pub = rospy.Publisher('Last_Hash', lastHash, queue_size=100)

    while(True):
        for i in range(len(SblockHash)):
            for j in range(len(SblockHash[i])):
                for z in range(len(SblockHash[i][j])):
                    hashingArray = hashlib.sha256(hashingArray + SblockHash[i][j][z]).hexdigest()
                # print(hashingArray)

        print(hashingArray)
        hashingArray = ''
        time.sleep(1)

if __name__ == '__main__':
    mixer()
    main()