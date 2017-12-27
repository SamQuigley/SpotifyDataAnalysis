import json
import csv

data_file = "../output/SpotifyTop100.json"

with open(data_file, "r") as file:
    data = json.load(file)

headers = list(data[0][0].keys())

headers.append("name")

with open("../output/SpotifyTop100.csv", "w") as f:
    writer = csv.writer(f , delimiter='\t')
    writer.writerow(headers)
    to_write = []
    for x in data:
        
        if type(x) is list:
            
            to_write+= list(x[0].values())
        # only writes after it finds the key word name
        if type(x) is str and x != "name":
            to_write.append(x)
            
            writer.writerow(to_write)
            to_write = []