Genre.destroy_all

jazz = Genre.create! name: "Jazz", description: "Stylish, free flowing music", image: "https://www.morrisonhotelgallery.com/images/big/LSA10.jpg"
blues = Genre.create! name: "Blues", description: "Smooth emotional music", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-Wp29TyxLTT7BEVEd0m8yHV2HzO1xlz1HpDl9dNaxGTk37CDZ4Q&s"
rock = Genre.create! name: "Rock", description: "Expresionist", image: "https://consequenceofsound.net/wp-content/uploads/2014/06/ledzeppelin1.jpg?quality=80&w=807"

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

harry = User.create! name: "Harry", email: "harry@hotmail.com", image: "Picture:here", bio: "Haz", password: "chicken"
puts
jake = User.create! name: "Jake", email: "jake@hotmail.com", image: "Picture:here", bio: "Pigeon", password: "chicken"

puts "You created #{User.count} users"

harry.genres << blues << rock
jake.genres << jazz << blues

puts "User #{User.first.name} like genres: #{User.first.genres.pluck(:name).join(', ')}"
