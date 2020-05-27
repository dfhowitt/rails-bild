# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "destroying everything"


Project.destroy_all
Site.destroy_all
Qualification.destroy_all
Placement.destroy_all
User.destroy_all


puts "creating everything :)"

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

User.create(
  first_name: 'Joe',
  last_name: 'Josephs',
  email: 'joe@gmail.com',
  password: '123456',
  phone_number: "0777777777",
  manager: false
  )

site_types = ['Commercial', 'Residential', 'Industrial']
locations = ['London', 'Madrid', 'Milan', 'Rome', 'Paris']
names = ['Vinci', 'Strata', 'Bouygues', 'MITIE', 'GallifordTry', 'Wates', 'Keller', 'Kier']
site_logos_array = [
                    "https://res.cloudinary.com/daxoj4nny/image/upload/v1590582694/bild%20company%20logos/Strata-Logo_dhxbtd.jpg",
                    "https://res.cloudinary.com/daxoj4nny/image/upload/v1590580745/bild%20company%20logos/OmjnWl3__400x400_rsginw.jpg",
                    "https://res.cloudinary.com/daxoj4nny/image/upload/v1590582694/bild%20company%20logos/158584_97056-morgan-sindall-logo_wbaaur.jpg",
                    "https://res.cloudinary.com/daxoj4nny/image/upload/v1590580744/bild%20company%20logos/unnamed_pgupxr.jpg",
                    "https://res.cloudinary.com/daxoj4nny/image/upload/v1590582694/bild%20company%20logos/Mitie-Logo-1_minvrx.jpg",
                    "https://res.cloudinary.com/daxoj4nny/image/upload/v1590580744/bild%20company%20logos/Wates-Group-logo_600x600_acf_cropped-600x600_nmnmzk.jpg",
                    "https://res.cloudinary.com/daxoj4nny/image/upload/v1590580744/bild%20company%20logos/Bouygues-logo_eptnou.jpg",
                    "https://res.cloudinary.com/daxoj4nny/image/upload/v1590582694/bild%20company%20logos/vinci-construction-logo_ylz1mo.jpg"
                   ]

counter = 0

names.each do |company|
  puts "creating site #{counter}"
  logo = URI.open(site_logos_array[counter])
  site = Site.new(
    name: company,
    site_type: site_types.sample,
    location: locations.sample,
    user_id: User.first.id
    )
  puts "site created"

  site.photo.attach(io: logo, filename: 'logo_pic.jpg', content_type: 'image/jpg')
  site.save
  counter += 1
end



sites = Site.all

job_types = ['Labourer', 'Skilled Labourer', 'Electrician', 'Asbestos Awareness', 'DBS Labourer']
qualifications = ['CSCS', 'Blue CSCS', 'ECS', 'Asbestos Awareness', 'DBS']

sites.each do |site|
  5.times do
    res_start_date = Faker::Date.forward(days: rand(1..15))
    index = rand(1..4)
    project = Project.new(
      start_date: res_start_date,
      end_date: res_start_date + rand(1..10),
      wage: rand(10..20),
      capacity: rand(1..20),
      description: Faker::Cannabis.health_benefit,
      site_id: site.id,
      job_type: job_types[index],
      autoconfirm: [true, false].sample
      )
    project.save
    ProjectQualification.create(
      project_id: project.id,
      qualification_id: qualifications[index]
    )
  end
end

qualifications.each do |qualification|
  Qualification.create(
    name: qualification
    )
end


User.all.each do |user|
  user_qualification_css = UserQualification.new(
    user_id: user.id,
    qualification_id: Qualification.find_by(name: qualifications[0]).id
  )
  user_qualification_css.save
end

User.all.each do |user|
  index = rand(1..4)
  user_qualification = UserQualification.new(
    user_id: user.id,
    qualification_id: Qualification.find_by(name: qualifications[index]).id
    )
  user_qualification.save
end

Project.all.each do |project|
  project_qualification = ProjectQualification.new(
    project_id: project.id,
    qualification_id: Qualification.find_by(name: qualifications[0]).id
    )
end

history_start_date = Faker::Date.backward(days: 15)
past_project = Project.new(
  start_date: history_start_date,
  end_date: history_start_date + rand(1..3),
  wage: rand(10..20),
  capacity: rand(1..20),
  description: Faker::Cannabis.health_benefit,
  site_id: Site.first.id,
  job_type: 'Labourer'
  )
past_project.save
Placement.create(
  user_id: User.find_by(first_name: 'Bob').id,
  project_id: past_project.id,
  confirmed: true
  )
