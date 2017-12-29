#!/usr/bin/env python
import re
import sys

for line in sys.stdin:

	val = line.strip()
	data = line.split("\t")  

	try:
		name=data[13]
		time=data[14]
	except ValueError:
		continue

	print('%s\t%s' % (name,time))