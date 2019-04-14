#! /usr/bin/python
import hashlib


def main():
    counter = 0
    while(True):
        string = ('hello' + str(counter))
        var = str(hashlib.sha256(string.encode()).hexdigest())

        if var[0] == '0' and var[1] == '0' and var[2] == '0' and var[3] == '0' and var[4] == '0' and var[5] == '0':
            print(var)
            print(string)
            break


        counter = counter + 1

if __name__ == '__main__':
    main()
`