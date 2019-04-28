#! /usr/bin/python
import hashlib, sys, random, rospy, threading, time, socket




def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    key = raw_input("What is your key?")
    
    

    s.connect(('172.21.4.153', 4000))
    s.sendall(key)
    data = s.recv(7)
    s.close()
    
    if data == 'success':
        var2 = raw_input("Please provide the details or your order: ProductNumber, Quantity, CustomerNumber: ")
	params = var2.split(',')  

        try:
            productNumber = params[0]
            quantity = params[1]
            customerNumber = params[2]

            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.connect(('172.21.0.90', 2000))
            sock.sendall('444;#RequestID=0;MClass=101;MNo=2;ErrorState=0;#PNo=' + productNumber + ';#CNo=' + customerNumber + ';#Aux1Int=' + quantity + ';\r')
            data = sock.recv(1024)
            sock.close()
            print("Your payment has been accepted and your order has been placed.")
            d = data.split(';')
            orderNumber = str(d[6])[4:8]            
	    print("Your order number is :" + str(orderNumber))

        except:
            print("Invailed order request")

        
    if data == 'failed':
	print("Your key was incorrect")
    


if __name__ == '__main__':
    main()



# THIS IS THE KEY => b4718ea7acc2e60199286959bffb58a78bb123ad6eece513123f7fc3b65149f5
