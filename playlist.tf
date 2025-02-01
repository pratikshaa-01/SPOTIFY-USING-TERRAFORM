resource "spotify_playlist" "Bollywood" {
    name   = "Bollywood"
    tracks = ["5QW9K4A1gMnIi94YUxtsfM"]
}

data "spotify_search_track" "emi" {
    artist = "Eminem"
}

resource "spotify_playlist" "slimShady" {
    name   = "slim shady"
    tracks = [
        data.spotify_search_track.emi.tracks[0].id,
        data.spotify_search_track.emi.tracks[1].id,
        data.spotify_search_track.emi.tracks[2].id
    ]
}
