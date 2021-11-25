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

CourtType.create(name: "basketball")
CourtType.create(name: "ping pong")
CourtType.create(name: "volleyball")

basketball_addresses = [
  "Belgradstraße 195, München",
  "Demleitnerstraße 4, München",
  "Mankeiweg, München", # Sintpertstraße 9
  "Maßmann Park, München", # Streetballplatz "Maßmannpark", Heßstraße 77, 80797 München
  "Westpark, München",
  "Max-Planck-Straße, München",
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
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685214/sportious/courts/basketball/Max-Planck-Stra%C3%9Fe_jn2c5k.jpg",
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

beach_volleyball_addresses.each do |address|
  court = Court.new(
    address: address,
    court_type: CourtType.third,
    user: users.sample
  )
  court.save!
  beach_volleyball_courts << court
end

pingpong_addresses = [
  "Marlene-Dietrich-Straße 5, München",
  "Wilderich-Lang-Straße 10, München",
  "Heßstraße 77, München",
  "Friedrichstraße 15, München",
  "Dietramszeller Str. 9, München",
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
  "https://res.cloudinary.com/dhr7binhu/image/upload/v1637685708/sportious/courts/pingpong/Dietramszeller-Str.-9_yveboq.jpg",
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

puts "Finished courts"
