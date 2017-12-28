import csv
path="../output/MyTop100.csv"
with open(path) as csvfile:
    readCSV = csv.reader(csvfile, delimiter='\t')
    count=0
    for row in readCSV:
        # ms=int(row[16])
        # ms = int(ms)
        # secs=(ms/1000)%60
        # secs=int(secs)
        # mins=(ms/(1000*60))%60
        # mins=int(mins)
        # print ("%d:%d" % (mins, secs))
        try:
            ms=int(row[16])
            ms = int(ms)
            secs=(ms/1000)%60
            secs=int(secs)
            mins=(ms/(1000*60))%60
            mins=int(mins)
            print(mins,secs)
            
            
            
        except Exception as e:
            pass
           
