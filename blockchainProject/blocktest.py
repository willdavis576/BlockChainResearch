import hashlib

blockHash = ''

class block:
	#prev hash
	#current data
	#timestamp
	
	#group all the data
	#hash the group = block complete -> blockHash

	#to read the data, call the block from the hash


	prevHash = blockHash #blockHash of the previous block
	##print(prevHash)
	currentData = "Hello"
	#timestamp not used yet
	##print(currentData)
	contains = prevHash + currentData
	##print(contains)

	def encrypt_string(contains):
    		sha_signature = hashlib.sha256(contains.encode()).hexdigest()
		return sha_signature

	

	#def __repr__(self):
		#return encrypt_string(contains)



if __name__ == '__main__':
	block2 = block()
	print(block2.encrypt_string)
