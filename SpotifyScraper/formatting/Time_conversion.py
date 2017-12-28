import csv
path="../output/MyTop100.csv"
path2="../output/SpotifyTop100.csv"
dataset_path="../../datasets/MyTop100.csv"
dataset_path2="../../datasets/SpotifyTop100.csv"
with open(path) as csvfile:
    readCSV = csv.reader(csvfile, delimiter='\t')
    count=0
    msWriter = csv.writer(open(dataset_path,  'a'), delimiter='\t',quotechar='|', quoting=csv.QUOTE_MINIMAL)
    msWriter.writerow(['Duration'])
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
            msWriter.writerow([duration_mins])
        except Exception as e:
            pass



with open(path2) as csvfile:
    readCSV = csv.reader(csvfile, delimiter='\t')
    count=0
    msWriter = csv.writer(open(dataset_path2,  'a'), delimiter='\t',quotechar='|', quoting=csv.QUOTE_MINIMAL)
    msWriter.writerow(['Duration'])
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
            msWriter.writerow([duration_mins])
        except Exception as e:
            pass



