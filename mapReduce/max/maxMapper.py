#!/usr/bin/env python
import re
import sys

for line in sys.stdin:

	val = line.strip()
	data = line.split("\t")  

	try:
		role=data[16]
		# rate=int(data[19])
	except IndexError:
		continue

	print('%s\t%s' % (role))