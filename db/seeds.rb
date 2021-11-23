# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Court.destroy_all
User.destroy_all

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

basketball_addresses.each do |address|
  court = Court.new(
    address: address,
    court_type: "basketball"
  )
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
    court_type: "beach_volleyball"
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

pingpong_addresses.each do |address|
  court = Court.new(
    address: address,
    court_type: "ping pong"
  )
  court.save!
  pingpong_courts << court
end

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
    password: Faker::Internet.password
  )
  user.save!
  users << user
end
