import numpy as np
import cv2
import time 

cap = cv2.VideoCapture(1)
time.sleep(2)

while(True):
	ret, frame = cap.read()
	#gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
	cv2.imshow('frame',frame)
	#cv2.imshow('gray',gray)
	if cv2.waitkey(20) & 0xFF == ord('q'):
		break
cap.release()
cv2.destroyAllWindows()
