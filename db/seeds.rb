# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying everything"

Project.destroy_all
Site.destroy_all
Qualification.destroy_all
Placement.destroy_all
User.destroy_all

puts "creating users"

user_names = %w(Faris Chris Gus Dan)

user_names.each do |name|
  User.create(first_name: name,
              last_name: "Bild",
              email: "#{name}@gmail.com",
              password: "123456",
              phone_number: "0777777777",
              manager: true
              )
end

User.create(
  first_name: 'Bob',
  last_name: 'Bobbins',
  email: 'bob@gmail.com',
  password: '123456',
  phone_number: "0777777777",
  manager: false
  )

site_types = ["Commercial", "Residential", "Industrial"]
locations = ['London', 'Madrid', 'Milan', 'Rome', 'Paris']
names = ['Vinci', 'Strata', 'Bouygues', 'MITE']

names.each do |company|
  Site.create(
    name: company,
    site_type: site_types.sample,
    location: locations.sample,
    user_id: User.first.id
    )
end

sites = Site.all

job_types = ['Labourer', 'Electrictian', 'Asbestos Awareness', 'DBS Labourer', 'Plumber']
sites.each do |site|
  5.times do
    res_start_date = Faker::Date.forward(days: rand(1..15))
    Project.create(
      start_date: res_start_date,
      end_date: res_start_date + rand(1..10),
      wage: rand(10..20),
      capacity: rand(1..20),
      description: Faker::Cannabis.health_benefit,
      site_id: site.id,
      job_type: job_types.sample
      )
  end
end

