import spotipy,json,pprint
sp = spotipy.Spotify()
from spotipy.oauth2 import SpotifyClientCredentials
cid ="4ddaaefb52d6432da0eac4873ae58846"
secret = "4b6bcb9ce4d648fd9f6d637b91b47ca2"
client_credentials_manager = SpotifyClientCredentials(client_id=cid, client_secret=secret)
sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)
sp.trace=False
# spotify:user:spotify:playlist:4hOKQuZbraPDIfaGbM3lKI - user spotify & playlist ID
def spotifyTop():
    playlist = sp.user_playlist("spotify", "4hOKQuZbraPDIfaGbM3lKI")
    songs = playlist["tracks"]["items"]
    ids = []
    tracks=[]
    for i in range(len(songs)):
        ids.append(songs[i]["track"]["id"])
        features = sp.audio_features(ids)
        tracks.append(sp.audio_features(ids))
        tracks.append("name")
        tracks.append(songs[i]["track"]["name"])
    #output JSON
    with open('output/SpotifyTop100.json', 'w') as outfile:
        json.dump(tracks, outfile)


def myTop():
    playlist = sp.user_playlist("1195494385", "00Hc2R2oeXclqu7NvEOh41")
    songs = playlist["tracks"]["items"]
    ids = []
    tracks=[]
    for i in range(len(songs)):
        ids.append(songs[i]["track"]["id"])
        features = sp.audio_features(ids)
        tracks.append(sp.audio_features(ids))
        tracks.append("name")
        tracks.append(songs[i]["track"]["name"])    
    #output JSON
    with open('output/MyTop100.json', 'w') as outfile:
        json.dump(tracks, outfile)


spotifyTop()
myTop()