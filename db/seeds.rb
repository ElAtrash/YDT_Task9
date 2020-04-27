# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning Database...'
User.delete_all
Log.delete_all

puts 'Creating Users...'
friend_attributes = []
10.times do
  friend_data = {
    login: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6)
  }

  friend_attributes << friend_data
end

neutrality_attributes = []
10.times do
  neutrality_data = {
    login: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6)
  }

  neutrality_attributes << neutrality_data
end

enemy_attributes = []
10.times do
  enemy_data = {
    login: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6)
  }

  enemy_attributes << enemy_data
end

Friend.create!(friend_attributes)
Neutrality.create!(neutrality_attributes)
Enemy.create!(enemy_attributes)
puts 'Done!'