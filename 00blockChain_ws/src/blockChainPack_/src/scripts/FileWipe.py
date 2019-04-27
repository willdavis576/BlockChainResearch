#! /usr/bin/python
import shutil, os


def main():
    for i in range(6):
        shutil.rmtree("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_NODE" + str(i + 1))
        os.mkdir("/home/ros/blockChainGit/00blockChain_ws/Receipts/MES_NODE" + str(i + 1))

if __name__ == '__main__':
    main()