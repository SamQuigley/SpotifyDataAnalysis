#!/usr/bin/env python

import sys
myList=[]

for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    data = line.split("\t")     
   
    try:
        tempo = data[10]
    except IndexError:
        continue
    
    myList.append(tempo)
   
    

for tempo in myList:
    print('%s\t%s'% (tempo, 1))