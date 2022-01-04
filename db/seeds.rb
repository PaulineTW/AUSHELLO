require 'csv'


puts 'Cleaning users from the database...'

User.destroy_all

puts 'Cleaning resources from the database...'
Resource.destroy_all

puts 'Creating 3 users ...'
user1 = User.create!(email: 'admin@admin.com', password: 'password')
user2 = User.create!(email: 'julianne@user1.com', password: 'password')
user3 = User.create!(email: 'pauline@user2.com', password: 'password')

puts "Created #{User.count} users ..."

puts 'creating sample resources...'

# Resource.create!(name: 'Asylum Seeker Parish Support Program', category: 'Housing', description: 'This is a peak body for multiple member organisations such as CatholicCare, CAPSA, Brigidine, St Vinnies, and more. They organise forums and events to share information on advocacy and community support. Eg. the most recent forum involved teaching how to write letters of advocacy to government bodies. ', address: '383 albert street east melbourne', state: 'VIC', website: 'http://www.css.org.au/Asylum-Seekers-Support', phone: 392875566, email: 'office@css.org.au', status: 'confirmed', user_id:1)



# puts csv_text
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
csv_text = Rails.root.join('lib', 'seeds', 'sample_seed_two.csv')
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# filepath = 'sample_seed.csv'
puts csv_text
CSV.foreach(csv_text, csv_options) do |row|
  t = Resource.new
  t.name = row['name']
  t.category1 = row['category1']
  t.category2 = row['category2']
  t.category3 = row['category3']
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
end

puts "There are now #{Resource.count} rows in the resources table"
