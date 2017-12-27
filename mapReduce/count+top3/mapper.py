#!/usr/bin/env python

import sys
myList=[]

for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    data = line.split("\t")     
   
    try:
        state = data[11]
    except IndexError:
        continue
    
    myList.append(state)
   
    

for state in myList:
    print('%s\t%s'% (state, 1))