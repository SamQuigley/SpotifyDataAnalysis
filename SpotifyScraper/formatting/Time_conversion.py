import csv
path="../output/MyTop100.csv"
with open(path) as csvfile:
    readCSV = csv.reader(csvfile, delimiter='\t')
    count=0
    for row in readCSV:
        try:
            ms=int(row[16])
            ms = int(ms)
            secs=(ms/1000)%60
            secs=int(secs)
            mins=(ms/(1000*60))%60
            mins=int(mins)
            mins=str(mins)
            secs=str(secs)
            duration_mins=mins+"."+secs
            print(duration_mins)

        except Exception as e:
            pass


