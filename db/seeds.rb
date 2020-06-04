# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "destroying everything"

Message.destroy_all
Conversation.destroy_all
Placement.destroy_all
Project.destroy_all
Site.destroy_all
Qualification.destroy_all
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

User.create(
  first_name: 'Joe',
  last_name: 'Josephs',
  email: 'joe@gmail.com',
  password: '123456',
  phone_number: "0777777777",
  manager: false
  )

site_types = ['Commercial', 'Residential', 'Industrial']
locations = [
  '14 Jubilee Plc, London, SW3 3TD',
  '17 Draycott Ave, London, SW3 3BS',
  '93 Victoria Street, London, SW1 5JL',
  '17A Dean\'s Yard, London, SW1P 3PB',
  '32 Lupus St, London, SW1V 3DZ',
  '7 Ovington Square, London, SW3 1LH',
  '54 Islington Park St, London, N1 1PX',
  '54 Duncan Street, Shoreditch, LONDON, N1 8BW',
  '4 Compton Avenue, London, N1 2XD',
  '1 Islington Green, London, N1 2XH',
  'The Shopping Centre, 21, Parkfield St, London, N1 0PS',
  '42 Brixton Rd, London, SW9 6BT',
  '73 Rye Ln, London, SE15 5EX',
  '1 Canada Square, London, E14 5AX',
  '142 Bow Rd, London, E3 3AH',
  '6 Keystone Crescent, London, N1 9DS',
  '132 Caledonian Rd, London, N1 9RE',
  '112 Holloway Rd, London, N7 8JE',
  '35 Harley Street, London, W1G, 8QG',
  '15 Paddington Green, London, W2 1LG',
  '324 Kingsland Rd, London, E8 4DE',
  '45 Blackfriars Rd, London, SE1 8NZ',
  '23 Exhibition Rd, London, SW7 2PA',
  '2 Pelham Plc, London, SW7 2NH',
  '38 Parkgate Rd, London, SW11 4NW',
  '46 St George\'s Dr, London, SW1V 4BT',
  '3 Mercer St, London WC2H 9QN',
  '37 Neal St, London, WC2H 9PR',
  '28 Bury Pl, London, WC1A 2JA',
  '363 Strand, London, WC2E 7PX',
  '89 Stamford St, London, SE1 9NB',
  '8a London Bridge St, London SE1 9SG',
  '300 Kennington Rd, London, SE11 5QZ',
  '60 Cannon St, London, EC4N 6JP',
  '66 Queen St, London, EC4R 1EB',
  '106 Leadenhall St, London, EC3A 4AA',
  '17 Commercial St, London, E1 6LW',
  '71 Old Montague St, London, E1 5NL',
  '7 Luke St, London, EC2A 4PX',
  '18 Bethnal Green Rd, London, E1 6GY',
  '145 Brick Ln, London, E1 6SB',
  '19 De Beauvoir Rd, London, N1 5SF',
  '37 Lawford Road, London, N1 5BJ',
  '5 Englefield Rd, London, N1 4SB',
  '328 Liverpool Rd, London, N7 8PU',
  '24 Corsica St, London, N5 1JY',
  '46 Rodney Rd, London, SE17 1NA',
  '3 Aristotle Rd, London, SW4 7UY',
  '10 The Pavement, London SW4 0HY',
  '103 Gunterstone Rd, London, W14 9BT',
  ]

names = ['Vinci', 'Strata', 'Bouygues', 'MITIE', 'HomeServe', 'Wates', 'Morgan Sindall', 'Kier']
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

puts "creating sites"
locations[6..-1].each do |location|
  site = Site.new(
    name: names.sample,
    site_type: site_types.sample,
    location: location,
    user_id: User.find_by(first_name: 'Chris').id
    )
  if site.name == 'Strata'
    logo = URI.open(site_logos_array[0])
  elsif site.name == 'Kier'
    logo = URI.open(site_logos_array[1])
  elsif site.name == 'Morgan Sindall'
    logo = URI.open(site_logos_array[2])
  elsif site.name == 'HomeServe'
    logo = URI.open(site_logos_array[3])
  elsif site.name == 'MITIE'
    logo = URI.open(site_logos_array[4])
  elsif site.name == 'Wates'
    logo = URI.open(site_logos_array[5])
  elsif site.name == 'Bouygues'
    logo = URI.open(site_logos_array[6])
  elsif site.name == 'Vinci'
    logo = URI.open(site_logos_array[7])
  end
  site.photo.attach(io: logo, filename: 'logo_pic.jpg', content_type: 'image/jpg')
  site.save
end

locations[0..5].each do |location|
  site = Site.new(
    name: names.sample,
    site_type: site_types.sample,
    location: location,
    user_id: User.find_by(first_name: 'Faris').id
    )
  if site.name == 'Strata'
    logo = URI.open(site_logos_array[0])
  elsif site.name == 'Kier'
    logo = URI.open(site_logos_array[1])
  elsif site.name == 'Morgan Sindall'
    logo = URI.open(site_logos_array[2])
  elsif site.name == 'HomeServe'
    logo = URI.open(site_logos_array[3])
  elsif site.name == 'MITIE'
    logo = URI.open(site_logos_array[4])
  elsif site.name == 'Wates'
    logo = URI.open(site_logos_array[5])
  elsif site.name == 'Bouygues'
    logo = URI.open(site_logos_array[6])
  elsif site.name == 'Vinci'
    logo = URI.open(site_logos_array[7])
  end
  site.photo.attach(io: logo, filename: 'logo_pic.jpg', content_type: 'image/jpg')
  site.save
end


# names.each do |company|
#   puts "creating site #{counter}"
#   logo = URI.open(site_logos_array[counter])
#   site = Site.new(
#     name: company,
#     site_type: site_types.sample,
#     location: locations.sample,
#     user_id: User.first.id
#     )

#   site.photo.attach(io: logo, filename: 'logo_pic.jpg', content_type: 'image/jpg')
#   site.save
#   counter += 1
# end

puts "creating projects"

sites = Site.all

job_types = ['Labourer', 'Skilled Labourer', 'Electrician', 'Asbestos Awareness', 'DBS Labourer']
qualifications = ['CSCS', 'Blue CSCS (Skilled Labourer)', 'ECS', 'Asbestos Awareness', 'DBS']
descriptions = ['Worker needed for heavy lifiting. Must have good banter to get along with the other blokes.', 'Must have good tune selection so we can shubz on site.', 'Must like to be thrown at a bulls-eye target like in Wolf of Wall Street', 'Essex Geezer needed. Must like Stella and can down 2 pints in under 20 seconds.']

qualifications.each do |qualification|
  Qualification.create(
    name: qualification
    )
end

faris_sites = User.find_by(first_name: 'Faris').managed_sites
chris_sites = User.find_by(first_name: 'Chris').managed_sites

chris_sites.each do |site|
    res_start_date = Faker::Date.forward(days: rand(1..15))
    index = rand(1..4)
    project = Project.new(
      start_date: res_start_date,
      end_date: res_start_date + rand(1..10),
      wage: rand(10..20),
      capacity: rand(1..20),
      description: descriptions.sample,
      site_id: site.id,
      job_type: job_types[index],
      autoconfirm: [true, false].sample
      )
    project.save
    pq = ProjectQualification.new(
      project_id: project.id,
      qualification_id: Qualification.find_by(name: qualifications[index]).id
    )
    pq.save
end

faris_sites.each do |site|
  rand(2..8).times do
    res_start_date = Faker::Date.forward(days: rand(1..15))
    index = rand(1..4)
    project = Project.new(
      start_date: res_start_date,
      end_date: res_start_date + rand(1..10),
      wage: rand(10..20),
      capacity: rand(1..20),
      description: descriptions.sample,
      site_id: site.id,
      job_type: job_types[index],
      autoconfirm: [true, false].sample
      )
    project.save
    pq = ProjectQualification.new(
      project_id: project.id,
      qualification_id: Qualification.find_by(name: qualifications[index]).id
    )
    pq.save
  end
end

puts "creating qualifications"


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
  project_qualification = ProjectQualification.create(
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
  description: descriptions.sample,
  site_id: Site.first.id,
  job_type: 'Labourer'
  )
past_project.save
Placement.create(
  user_id: User.find_by(first_name: 'Bob').id,
  project_id: past_project.id,
  confirmed: true
  )
