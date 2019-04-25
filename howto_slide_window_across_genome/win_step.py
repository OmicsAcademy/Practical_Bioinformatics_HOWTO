#!/usr/bin/python

import sys
win_size = 100
step_size = 50 
with open(sys.argv[1]) as fileIn:
    for line in fileIn:
        line = line.rstrip()
	ele = line.split("\t")
	stt = 1;
	while(stt + win_size < int(ele[1])):
	    end = stt + win_size - 1
	    print ele[0] +"\t" + str(stt) + "\t" + str(end) 
            stt = stt +step_size

	    
	
