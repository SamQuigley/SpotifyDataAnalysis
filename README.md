# SpotifyDataAnalysis

This project is part of my Data Application Development module @ the National College of Ireland, delivered by Dr. Caton. 

# Project Flow (KDD)
```
#NodeSpotifyAPI
This is a simple credentials flow application used to obtain a users ID, 
which can be used as a paramter in API calls. 
Adopted from here -> https://developer.spotify.com/web-api/tutorial/

# Data Extraction & pre-processing
Scraper.py    -   pulls data from Spotifys API
jsonToCSV.py  -   converts API response from JSON to CSV
ms_to_mins.py -   adds the song duration to the dataset in mins/secs format

# Data Trnasformation, analysis, and vizualisation
Spotify.R     -   Imports the csv files, performs operations on the datasets, 
exports datasets to tab delimeted text files for mapReduce.

# mapReduce
count & top N -> song tempos
max -> song tempos
max -> song duration

# Knowledge
This project helped me undertand the core attributes to popular songs as well understand the attributes that are in my favourite songs and how the two datasets differ.
```

### Prerequisites

```
Python 3
Node.js
Spotipy(pip install)
```


## Built With

* [Spotipy](http://spotipy.readthedocs.io/en/latest/) - Lightweight Python library for the Spotify Web API.


## Authors

* **Sam Quigley** - [SamQuigley](https://github.com/SamQuigley)

## License

This project is licensed under the MIT License

## Acknowledgments

* https://opendatascience.com/blog/a-machine-learning-deep-dive-into-my-spotify-data/
* https://medium.com/cuepoint/visualizing-hundreds-of-my-favorite-songs-on-spotify-fe50c94b8af3
* I was inspired to undertake this project as a music lover and a computer science student, I wanted to understand what are the attributes that are common among my favoutite songs and compare them to the top 100 songs of 2017. From this proejct I have more knowledge about my own music taste and the current charts. 
