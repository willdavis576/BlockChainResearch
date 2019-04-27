#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time
from datetime import datetime
from collections import Counter


def main():
    string = ''
    newWord = ''
    newName = []
    name = [['' for _ in range(100)] for _ in range(100)]
    name[0] = ['ertert','ertertert','ertertertter','ertertert']
    for i in range (len(name[0])):
        string = string + name[0][i] + ','
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