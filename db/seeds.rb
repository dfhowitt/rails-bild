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
  '93 Victoria Street, London, SW1 5JL',
  '54 Islington Park St, London, N1 1PX',
  '54 Duncan Street, Shoreditch, LONDON, N1 8BW',
  '4 Compton Avenue, London, N1 2XD',
  '1 Islington Green, London, N1 2XH',
  'The Shopping Centre, 21, Parkfield St, London, N1 0PS',
  '17 Draycott Ave, London, SW3 3BS',
  '17A Dean\'s Yard, London, SW1P 3PB',
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
  'Via della Lungaretta, 17, 00153, Rome',
  'Via Portuense, 251, 00146, Rome',
  'Borgo Santo Spirito, 9A, 00193, Rome',
  'Via Crescenzio, 62, 00193, Rome',
  'Piazza Campo de\' Fiori, 27, 00186, Rome',
  'Via dei Crociferi, 22, 00187, Rome',
  'Via Sistina, 58b, 00187, Rome',
  'Via Lazio, 6, 00187, Rome',
  'Via Stefano Porcari, 4, 00193, Rome',
  'Via Cola di Rienzo, 140, 00193, Rome',
  '194 Rue Saint-Honoré, 75001, Paris',
  '5 Rue de Bellechasse, 75007, Paris',
  '31 Rue de Constantine, 75007, Paris',
  '17 Boulevard des Invalides, 75007, Paris',
  '18 Rue de Passy, 75016, Paris',
  '216 Boulevard Raspail, 75014, Paris',
  '12 Rue de Presbourg, 75116, Paris',
  '10 Rue de Saint-Sénoch, 75117, Paris',
  '20 Rue de Penthièvre, 75008, Paris',
  '18 Rue de Madrid, 75008, Paris',
  '116 Campbell Parade, NSW, 2026, Sydney',
  '17 Blair St, NSW, 2026, Sydney',
  '17 New S Head Rd, NSW, 2030, Syndey',
  '319 Castlereagh St, NSW, 2000, Sydney',
  '15 Bridge St, NSW, 2000, Sydney',
  '78 Inkerman St, VIC, 3182, Melbourne',
  '120 Jolimont Rd, VIC, 3002, Melbourne',
  '660 Elizabeth St, VIC, 3000, Melbourne',
  '77 Leveson St, VIC, 3051, Melbourne',
  '136 Exhibition St, VIC, 3000, Melbourne'
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

counter = 0

puts "creating sites"
locations.each do |location|
  site = Site.new(
    name: names.sample,
    site_type: site_types.sample,
    location: location,
    user_id: User.first.id
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

sites.each do |site|
  rand(1..4).times do
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
    ProjectQualification.create(
      project_id: project.id,
      qualification_id: qualifications[index]
    )
  end
end

puts "creating qualifications"

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
