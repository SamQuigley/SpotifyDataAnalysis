import spotipy,json,pprint
sp = spotipy.Spotify()
from spotipy.oauth2 import SpotifyClientCredentials
cid ="insert_client_id_here"
secret = "insert_secret_here"
client_credentials_manager = SpotifyClientCredentials(client_id=cid, client_secret=secret)
sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)
sp.trace=False
def playlistOne():
    playlist = sp.user_playlist("insert_user_id", "insert_playlist_id")
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


def playlistTwo():
    playlist = sp.user_playlist("insert_user_id", "insert_playlist_id")
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


playlistOne()
playlistTwo()