# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Song.destroy_all
Artist.destroy_all
Playlist.destroy_all
PlaylistSong.destroy_all

prince = Artist.create(name:"Prince")
muse = Artist.create(name: "Muse")
adele = Artist.create(name: "Adele")
gaga = Artist.create(name: "Lady Gaga")

rock = Playlist.create(name: "Rock")
pop = Playlist.create(name: "Pop")
favorities = Playlist.create(name: "Favorite Jams")

rain = prince.songs.create(title: 'Purple Rain', length: 832, play_count: 83209)
hysteria = muse.songs.create(title: 'Hysteria', length: 524, play_count: 97209)
someone = adele.songs.create(title: 'Someone Like You', length: 432, play_count: 746252)
hello = adele.songs.create(title: 'Hello', length: 362, play_count: 252587)
paparazzi = gaga.songs.create(title: 'Paparazzi', length: 524, play_count: 37205 )

PlaylistSong.create(song: rain, playlist: rock)
PlaylistSong.create(song: hysteria, playlist: rock)
PlaylistSong.create(song: someone, playlist: pop)
PlaylistSong.create(song: hello, playlist: pop)
PlaylistSong.create(song: paparazzi, playlist: pop)
PlaylistSong.create(song: rain, playlist: favorities)
PlaylistSong.create(song: hello, playlist: favorities)
