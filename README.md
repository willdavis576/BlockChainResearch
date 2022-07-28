# BlockChainResearch

Here lies the heart of my final year porject and how my project has progressed over time. The main of this project was to implement blockchain technology into an Industry 4 system. 

This factory onto which i built this system was a Festo Cyber Phyisical Factory running Siemens S7-1500 PLCs.

Since I needed a node based framework on which to build my blockchain, ROS was ideal since i had previous experience with it in robotics.
Each node on the blockchain is run on seperate Raspberry Pis (3B+), talking their own S7-1500 PLC over a TCP connection. 

This system is designed to track a product throughout its production life cycle and upload these data to the blockchain. Once a product reached the end of its production, the blockchain is closed, producing a blockchain receipt and storing it on a secure file server. 
The QR Code on the product can then be scanned and a proof of authenticity blockchain receipt can be viewed from the secure file server.

Simple threat detection:
While the system is running, each node will hash itself and all of the data contained using a SHA-256 encryption. This hash is broadcast on the last hash node in ROS. All nodes will keep track of all other nodes' hashs. Each node agrees on a majority hash that's common with all.
If a node is compromised, its hash will be different, all other nodes will notice this, delete the node, and reinitialise it.

An obvious caveat to this project is, yes, ROS Kinetic is not decentralised like a traditional blockchain system but the software is written as if it is decentrailised, since ROS is just being used for the node based communication. 

Project progress will pics and problems found here:
https://williamdavis83.wixsite.com/website

My paper on this:
An Innovative Blockchain-Based Traceability Framework for Industry 4.0 Cyber-Physical Factory https://eprints.mdx.ac.uk/34871/
