# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'uri'

Court.destroy_all
CourtType.destroy_all
User.destroy_all

users = []
user_admin = User.new(
  username: "marcel",
  email: "marcel@fonseca.com",
  password: "123456",
  admin: true
)
user_admin.save!
users << user_admin

10.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
  users << user
end

CourtType.create(name: "Basketball")
CourtType.create(name: "Ping-Pong")
CourtType.create(name: "Beach-Volleyball")

basketball_addresses = [
  "Belgradstraße 195, München",
  "Demleitnerstraße 4, München",
  "Mankeiweg, München", # Sintpertstraße 9
  "Maßmann Park, München", # Streetballplatz "Maßmannpark", Heßstraße 77, 80797 München
  "Westpark, München",
  "Matthias-Pschorr-Straße 4, München",
  "Barer Straße 29, München",
  "Ganghoferstraße 55, München",
  "Kazmairstraße 89, München"
]
basketball_courts = []
basketball_courts_images = [
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685195/sportious/courts/basketball/Belgradstra%C3%9Fe-195_phlvj8.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685226/sportious/courts/basketball/Demleitnerstra%C3%9Fe-4_xvan0d.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685240/sportious/courts/basketball/Mankeiweg_ziajnd.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685203/sportious/courts/basketball/Ma%C3%9Fmann-Park_ldpygx.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685210/sportious/courts/basketball/Westpark_qpp7qs.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685222/sportious/courts/basketball/Matthias-Pschorr-Stra%C3%9Fe_4_a99uee.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685197/sportious/courts/basketball/Barer-Stra%C3%9Fe-29_n0zla4.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685200/sportious/courts/basketball/Ganghoferstra%C3%9Fe-55_rc93ze.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685212/sportious/courts/basketball/Kazmairstra%C3%9Fe-89_urnauy.jpg"
]
puts "Creating courts..."

basketball_addresses.each_with_index do |address, index|
  court = Court.new(
    address: address,
    court_type: CourtType.first,
    user: users.sample
  )
  url = basketball_courts_images[index]
  file = URI.open(url)
  court.photo.attach(io: file, filename: 'court.png', content_type: 'image/png')
  court.save!
  basketball_courts << court
end
# creating lessons for basketball courts
puts "starting basketlessons"
basketball_titles = ["Basketball Passing Skills", "Hooping like a Pro", "Defense Training", "Athletic Training - Basketball"]
basketball_desc = ["I was training basketball for over 10 years. I want to teach and show some tricks how to optimize your passing skills, as its elementary for your success", "We want to training on your general physics such as jumping or speed.", "Lets improve together your basketball basics. I can show you how to shoot hoops easily, how to defense and attack."]
basketball_courts.each do |court|
  lesson1 = Lesson.new(
    title: basketball_titles.sample,
    description: basketball_desc.sample,
    start_time:  DateTime.new(2021, 12, 3, 16, 45),
    end_time: DateTime.new(2021, 12, 31, 17, 45),
    capacity: [4, 2, 6].sample,
    price: [4.5, 2, 6, 0].sample,
    court: court,
    user: users.sample
  )
  lesson1.save!
end


beach_volleyball_addresses = [
  "Am Eventpark 20, Aschheim",
  "Heinrich-Wieland-Straße 24, München",
  "Am Hang, Krailling",
  "Kolehmainenweg, München",
  "Schleissheimer Strasse 393, München",
  "Gröbenrieder Strasse 21, Dachau",
  "Münchner Strasse 15, Unterföhring",
  "Föhringer Ring 5, München",
  "Weltenburger Strasse, München",
  "Köglweg 99, Taufkirchen"
]
beach_volleyball_courts = []
beach_volleyball_courts_image = "https://res.cloudinary.com/dhr7binhu/image/upload/v1637923446/sportious/courts/volleyball_court_qgpshp.jpg"
beach_volleyball_addresses.each do |address|
  court = Court.new(
    address: address,
    court_type: CourtType.third,
    user: users.sample
  )
  file = URI.open(beach_volleyball_courts_image)
  court.photo.attach(io: file, filename: 'court.png', content_type: 'image/png')
  court.save!
  beach_volleyball_courts << court
end

# creating lessons for volleyball courts
puts "starting volleylessons"
volleyball_titles = ["Beachvolleyball Allround Training", "Attacking & Blocking for Beginners", "How to pass and set the ball properly"]
volleyball_desc = ["Lets get ready for summer. I will show you the secrets of beach volleyball, so you succeed at your next match", "Very basic alround beach training to get familiar with the very basics. For anyone who wants to get started.", "Lets improve together your volleyball basics. I can show you how to block or attack."]
beach_volleyball_courts.each do |court|
  lesson2 = Lesson.new(
    title: volleyball_titles.sample,
    description: volleyball_desc.sample,
    start_time:  DateTime.new(2021, 12, 3, 16, 45),
    end_time: DateTime.new(2021, 12, 31, 17, 45),
    capacity: [4, 2, 6].sample,
    price: [0, 3, 5, 5, 3.5].sample,
    court: court,
    user: users.sample
  )
  lesson2.save!
end

pingpong_addresses = [
  "Marlene-Dietrich-Straße 5, München",
  "Wilderich-Lang-Straße 10, München",
  "Heßstraße 77, München",
  "Friedrichstraße 15, München",
  "Marbachstraße 4, München",
  "Böhmerwaldpl. 11, München",
  "Salzsenderweg, München",
  "Denninger Straße 39, München",
  "Plinganserstraße 58, München"
]
pingpong_courts = []
pingpong_courts_images = [
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685709/sportious/courts/pingpong/Marlene-Dietrich-Stra%C3%9Fe-5_nxxxnq.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685709/sportious/courts/pingpong/Wilderich-Lang-Stra%C3%9Fe-10_akgxdm.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685704/sportious/courts/pingpong/He%C3%9Fstra%C3%9Fe-77_pfcyzj.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685705/sportious/courts/pingpong/Friedrichstra%C3%9Fe-15_wnwjq8.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685706/sportious/courts/pingpong/Marbachstra%C3%9Fe-4_up5jd5.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685709/sportious/courts/pingpong/Bo%CC%88hmerwaldpl.-11_d7mehn.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685708/sportious/courts/pingpong/Salzsenderweg_ils7le.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685708/sportious/courts/pingpong/Denninger-Stra%C3%9Fe-39_hprjuk.jpg",
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685711/sportious/courts/pingpong/Plinganserstra%C3%9Fe-58_tsdze4.jpg"
]

pingpong_addresses.each_with_index do |address, index|
  court = Court.new(
    address: address,
    court_type: CourtType.second,
    user: users.sample
  )
  url = pingpong_courts_images[index]
  file = URI.open(url)
  court.photo.attach(io: file, filename: 'court.png', content_type: 'image/png')
  court.save!
  pingpong_courts << court
end

# creating lessons for pingpong tables
puts "starting pingpong lessons"
pingpong_titles = ["Learning Forehand Drive & Backhand Drive", "Methods for returning serves - beginner and intermediate level", "Spinning the ball - but how?", "Basic Table Tennis Training", "Intermediate Training"]
pingpong_desc = ["Practice refers to all the time you spend developing your table tennis game by concentrating on some aspects you want to strengthen.", "To really advance your game, it’s important to find others with similar goals and playing levels and practice/train with them. A table tennis club is a great place to do this.", "Lets work together on our skills and improve them to enjoy table tennis even more."]
pingpong_courts.each do |table|
  random_day = rand(3..31)
  random_starttime = rand(15..19)
  lesson3 = Lesson.new(
    title: pingpong_titles.sample,
    description: pingpong_desc.sample,
    start_time: DateTime.new(2021, 12, random_day, random_starttime, 00),
    end_time: DateTime.new(2021, 12, random_day, random_starttime+rand(1..2), 00),
    capacity: [4, 2, 6].sample,
    price: [0, 0, 2, 4, 3.5].sample,
    court: table,
    user: users.sample
  )
  lesson3.save!
end

puts "Finished courts"

# puts "starting reviews"
# all_courts = []
# all_courts << basketball_courts
# all_courts << beach_volleyball_courts
# all_courts << pingpong_courts



# review1 = Review.new(
#   title: "Great Court",
#   content: "Really good spot. Great surrounding. ",
#   rating: "4",
#   user: users.sample,
#   court: all_courts.sample
# )
# review1.save!

# review2 = Review.new(
#   title: "Cool People",
#   content: "I met so nice people there - big fun!",
#   rating: "5",
#   user: users.sample,
#   court: all_courts.sample
# )
# review2.save!

# review3 = Review.new(
#   title: "Not too good condition",
#   content: "The court itself was in not as good shape as expected.",
#   rating: "2",
#   user: users.sample,
#   court: all_courts.sample
# )
# review3.save!

# review4 = Review.new(
#   title: "Too many kids",
#   content: "Couldn't really play for there were so many children.",
#   rating: "2",
#   user: users.sample,
#   court: all_courts.sample
# )
# review4.save!

# review5 = Review.new(
#   title: "Top!",
#   content: "So much fun - great court",
#   rating: "5",
#   user: users.sample,
#   court: all_courts.sample
# )
# review5.save!

# review6 = Review.new(
#   title: "OK",
#   content: "no lightning, bad ground",
#   rating: "2",
#   user: users.sample,
#   court: all_courts.sample
# )
# review6.save!

# review7 = Review.new(
#   title: "Cool lesson",
#   content: "Came for a training here, was a great success.",
#   rating: "5",
#   user: users.sample,
#   court: all_courts.sample
# )
# review7.save!
# puts "finished reviews"
