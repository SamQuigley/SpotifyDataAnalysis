# SpotifyDataAnalysis

This project is part of my Data Application Developemnt module @ the National College of Ireland, delivered by Dr. Caton. 

# Project Flow
```
# Data Extraction & pre-processing
Scarper.py    -   pulls data from Spotifys API
jsonToCSV.py  -   converts API response from JSON to CSV
ms_to_mins.py -   adds the song duration to the dataset in mins/secs format

# Data Trnasformation, alaysis, and vizualisation
Spotify.R     -   Imports the csv files, performs operations on the datasets, exports the to tab delimeted text files.

# mapReduce
count & top N -> song tempos
max -> song tempos
max -> song duration
```

### Prerequisites

What things you need to install the software and how to install them

```
Python 3
Node.js
Spotipy(pip install)
```


## Built With

* [Spotipy](http://spotipy.readthedocs.io/en/latest/) - The Python library used


## Authors

* **Sam Quigley** -complete* - [SamQuigley](https://github.com/SamQuigley)

See also the list of [contributors](https://github.com/SamQuigley/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* https://opendatascience.com/blog/a-machine-learning-deep-dive-into-my-spotify-data/
* https://medium.com/cuepoint/visualizing-hundreds-of-my-favorite-songs-on-spotify-fe50c94b8af3
* I was inspired to undertake this project my the many web applications that exist, that tell the user their favourite songs. I wanted to uderstand what attribtes make these songs.
