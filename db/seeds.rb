Genre.destroy_all

jazz = Genre.create! name: "Jazz", description: "Stylish, free flowing music"
blues = Genre.create! name: "Blues", description: "Smooth emotional music"
rock = Genre.create! name: "Rock", description: "Expresionist"

puts "Created #{Genre.count} genres."

Song.destroy_all

take_five = Song.create! name: "Take Five", artist: "Dave Brubeck", sheet: "Take Five sheet"
at_last = Song.create! name: "At Last", artist: "Miles Davis", sheet: "At last sheet"
how_blues = Song.create! name: "How Blues Can You Get", artist: "BB King", sheet: "How blues sheet"
johnny_b = Song.create! name: "Johnny B Goode", artist: "Chuck Berry", sheet: "B Goode sheet"
substitute = Song.create! name: "Substitute", artist: "The Who", sheet: "Substitute sheet"
strange = Song.create! name: "People are Strange", artist: "The Doors", sheet: "Strange sheet"

puts "Created #{Song.count} songs."


jazz.songs << take_five << at_last
blues.songs << how_blues << johnny_b
rock.songs << substitute << strange
# at_last.genres << jazz
# how_blues.genres << blues
# johnny_b.genres << blues
# substitute.genres << rock
# strange.genres << strange

puts "Songs in #{Genre.first.name}: #{Genre.first.songs.pluck(:name).join(", ")}"
puts "Songs in #{Genre.last.name}: #{Genre.last.songs.pluck(:name).join(", ")}"

User.destroy_all

harry = User.create! name: "Harry", email: "harry@hotmail.com", image: "Picture:here", bio: "Haz"
jake = User.create! name: "Jake", email: "Jake@hotmail.com", image: "Picture:here", bio: "Pigeon"

puts "You created #{Genre.count} users"
