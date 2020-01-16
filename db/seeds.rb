User.destroy_all

harry = User.create! name: "Harry", email: "harry@hotmail.com", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579139608/project1-ga/harry-dp_lg7png.jpg", bio: "Haz", password: "chicken"
puts
jake = User.create! name: "Jake", email: "jake@hotmail.com", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579139612/project1-ga/jake-dp_qad7r8.jpg", bio: "Pigeon", password: "chicken"

puts "You created #{User.count} users"


Genre.destroy_all

jazz = Genre.create! name: "Jazz", description: "Stylish, free flowing music", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133058/project1-ga/louis-jazz-musik-database_l2izpe.jpg"
blues = Genre.create! name: "Blues", description: "Smooth emotional music", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133068/project1-ga/Screen_Shot_2020-01-16_at_10.57.02_am_jtrizp.png"
rock = Genre.create! name: "Rock", description: "Arnarchist expression", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133053/project1-ga/ledzeppelin-musik-database_fjjiqi.jpg"
punk = Genre.create! name: "Punk", description: "Fast and loud", image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAY_yZT7yOw86u6dyaF1z0CZH2SEP3QNYbGOF_jlaUofV_yw9mVQ&s'
soul = Genre.create! name: "Soul", description: "Heart felt and fun", image: 'https://res.cloudinary.com/dm0vmiksn/image/upload/v1579134205/project1-ga/aretha-musik-db_zmluge.png'

puts "Created #{Genre.count} genres."

Song.destroy_all

take_five = Song.create! name: "Take Five", artist: "Dave Brubeck", sheet: "https://www.youtube.com/watch?v=vmDDOFXSgAs", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133701/project1-ga/take-5-musik-db_dnu3kg.jpg"
at_last = Song.create! name: "At Last", artist: "Miles Davis", sheet: "At last sheet", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133646/project1-ga/atlast-musik-db_glsslm.jpg"
how_blues = Song.create! name: "How Blues Can You Get", artist: "BB King", sheet: "How blues sheet", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133667/project1-ga/howblue-musik-db_ujdj5a.jpg"
johnny_b = Song.create! name: "Johnny B Goode", artist: "Chuck Berry", sheet: "B Goode sheet", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133673/project1-ga/johnnBgoode-musik-db_vouzwc.jpg"
substitute = Song.create! name: "Substitute", artist: "The Who", sheet: "Substitute sheet", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133692/project1-ga/substitute-musik-db_hgrkd5.jpg"
strange = Song.create! name: "People are Strange", artist: "The Doors", sheet: "Strange sheet", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133684/project1-ga/strange-people-musik-db_vy8wen.jpg"
brown_sugar = Song.create! name: "Brown Sugar", artist: "Rolling Stones", sheet: "Sugar sheet", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133658/project1-ga/brown-sugar-musik-db_pvcaay.jpg"
because = Song.create! name: "Because the night", artist: "Paddy Smith", sheet: "Because sheet", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579133654/project1-ga/because-musik-db_a1qupj.jpg"
politicains = Song.create! name: "Politicains in my Eyes", artist: "Death", sheet: 'death sheet', image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579134576/project1-ga/politicans-musik-db_snpgme.jpg"
ifeellove = Song.create! name: "I feel love", artist: "Donna Summer", sheet: "Love cheet", image: "https://res.cloudinary.com/dm0vmiksn/image/upload/v1579134469/project1-ga/i-feel-love-musik-db_dqtv5v.jpg"

puts "Created #{Song.count} songs."

harry.genres << rock << punk << soul
jake.genres << jazz << blues

puts "User #{User.first.name} like genres: #{User.first.genres.pluck(:name).join(', ')}"

jazz.songs << take_five << at_last
blues.songs << how_blues << johnny_b
rock.songs << substitute << strange << brown_sugar
punk.songs << politicains
soul.songs << ifeellove
# at_last.genres << jazz
# how_blues.genres << blues
# johnny_b.genres << blues
# substitute.genres << rock
# strange.genres << strange

puts "Songs in #{Genre.first.name}: #{Genre.first.songs.pluck(:name).join(", ")}"
puts "Songs in #{Genre.last.name}: #{Genre.last.songs.pluck(:name).join(", ")}"

Artist.destroy_all
acdc = Artist.create! name: "ACDC"
tv = Artist.create! name: "Tunnel Vision"

puts "Created #{Artist.count} artists, Last one called #{Artist.last.name}"

Concert.destroy_all
bdo = Concert.create! name: "Big Day Out"

puts "Created #{Concert.count} concert, Last one called #{Concert.last.name}"
