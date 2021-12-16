# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning users from the database...'

User.destroy_all

puts 'Creating 3 users ...'
user1 = User.create!(email: 'admin@admin.com', password: 'password')
user2 = User.create!(email: 'julianne@user1.com', password: 'password')
user3 = User.create!(email: 'pauline@user2.com', password: 'password')

puts "Created #{User.count} users ..."
