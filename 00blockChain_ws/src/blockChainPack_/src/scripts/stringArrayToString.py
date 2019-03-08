#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time
from datetime import datetime
from collections import Counter


def main():
    string = ''
    newWord = ''
    newName = []
    name = ['dfgdfg','sdfsdgsdfg','dfgdfgdsfgsgdn','dfgsdfgfsdg','dfgdfg']
    for i in range (len(name)):
        string = string + name[i] + ','
    print(string)

    print(string.index(','))

    try:
        for i in range (len(string)):
            newWord = ''
            for j in range (string.index(',')):
                newWord = newWord + string[j]
                print(newWord)
            mid = (string.index(',') + 1)
            secondHalf = string[mid:].lower()

            string = secondHalf
            newName.append(newWord)
            print(newName)
    except:
        ye = "great"

if __name__ == '__main__':
    main()