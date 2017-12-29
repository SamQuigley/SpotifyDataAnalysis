import csv
path="../output/MyTop100.csv"
path2="../output/SpotifyTop100.csv"
dataset_path="../../datasets/MyTop100.csv"
dataset_path2="../../datasets/SpotifyTop100.csv"


with open(path,'r') as csvinput:
    with open(dataset_path, 'w') as csvoutput:
        writer = csv.writer(csvoutput, delimiter='\t')
        reader = csv.reader(csvinput, delimiter="\t")

        all = []
        row = next(reader)
        row.append('length')     
        all.append(row)
        
        for row in reader:
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
                row.append(duration_mins)
                all+=[row]
            except Exception:
                pass

        writer.writerows(all)

with open(path2,'r') as csvinput:
    with open(dataset_path2, 'w') as csvoutput:
        writer = csv.writer(csvoutput, delimiter='\t')
        reader = csv.reader(csvinput, delimiter="\t")

        all = []
        row = next(reader)
        row.append('length')     
        all.append(row)
        
        for row in reader:
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
                
                row.append(duration_mins)
                all+=[row]
            except Exception:
                pass

        writer.writerows(all)
