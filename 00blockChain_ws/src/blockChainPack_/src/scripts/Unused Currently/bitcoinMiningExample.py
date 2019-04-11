#! /usr/bin/python
import hashlib


def main():
    counter = 0
    while(True):
        string = ('hello' + str(counter))
        var = str(hashlib.sha256(string.encode()).hexdigest())

        if var[0] == '0':
            print(var)
            print(string)
            break


        counter = counter + 1

if __name__ == '__main__':
    main()