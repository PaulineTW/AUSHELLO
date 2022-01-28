require 'csv'

puts 'Cleaning resources from the database...'
Resource.destroy_all

puts 'Cleaning users from the database...'
User.destroy_all

puts 'Creating 4 users ...'
admin = User.create!(email: 'admin@admin.com', password: 'password', admin: true)
user1 = User.create!(email: 'julianne@user1.com', password: 'password', admin: false)
user2 = User.create!(email: 'pauline@user2.com', password: 'password', admin: false)
user3 = User.create!(email: 'elliot@user3.com', password: 'password', admin: false)
puts "Created #{User.count} users ..."

puts 'creating resources...'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
csv_text = Rails.root.join('lib', 'seeds', 'AUSHELLO_seeds_actual_final.csv')
puts csv_text
CSV.foreach(csv_text, csv_options) do |row|
  t = Resource.new
  t.name = row['name']
  t.description = row['description']
  t.full_address = row['full_address']
  t.address = row['address']
  t.state = row['state']
  t.website = row['website']
  t.phone = row['phone']
  t.email = row['email']
  t.status = row['status']
  t.user_id = user1.id
  t.save!
  puts "#{t.name} saved"
  t.category_list = row['categories']
  t.save!
end

puts "There are now #{Resource.count} rows in the resources table"
