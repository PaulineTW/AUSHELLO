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

puts 'creating 1 resource...'

Resource.create!(name: 'Asylum Seeker Parish Support Program', category: 'Housing', description: 'This is a peak body for multiple member organisations such as CatholicCare, CAPSA, Brigidine, St Vinnies, and more. They organise forums and events to share information on advocacy and community support. Eg. the most recent forum involved teaching how to write letters of advocacy to government bodies. ', address: '383 albert street east melbourne', state: 'VIC', website: 'http://www.css.org.au/Asylum-Seekers-Support', phone: 392875566, email: 'office@css.org.au', status: 'confirmed', user_id:1)
