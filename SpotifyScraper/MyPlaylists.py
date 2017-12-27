import spotipy,pprint,json
from spotipy.oauth2 import SpotifyClientCredentials

client_credentials_manager = SpotifyClientCredentials(client_id='4ddaaefb52d6432da0eac4873ae58846', client_secret='4b6bcb9ce4d648fd9f6d637b91b47ca2')
sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)

playlists = sp.user_playlists('1195494385')
while playlists:
    for i, playlist in enumerate(playlists['items']):
        print("%4d %s %s" % (i + 1 + playlists['offset'], playlist['uri'],  playlist['name']))
    if playlists['next']:
        playlists = sp.next(playlists)
    else:
        playlists = None

pp = pprint.PrettyPrinter(indent=4)
pp.pprint(playlists)
