#!/usr/bin/env python
import re
import sys

for line in sys.stdin:

	val = line.strip()
	data = line.split("\t")  

	try:
		name=data[13]
		time=int(data[10])
	except ValueError:
		continue

	print('%s\t%s' % (name,time))