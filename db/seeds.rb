# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

JobSeeker.delete_all 
HiringManager.delete_all
JobListing.delete_all
JobApplication.delete_all

job_seekers = []
hiring_managers = []
job_listing = []

15.times do 

job_seekers << JobSeeker.create(
  name: Faker::Name.name,
  email: Faker::Internet.unique.email,
  password:Faker::Internet.password,
  address:Faker::Address.full_address,
  profile_picture:Faker::Avatar.image,
  phone:Faker::PhoneNumber.cell_phone,
  resume_link:"",
  website_link:Faker::Internet.url,
  title_tagline: Faker::Company.profession
)

hiring_managers << HiringManager.create(
  name: Faker::Name.name,
  email: Faker::Internet.unique.email,
  password:Faker::Internet.password,
  company:Faker::Company.name,
  phone:Faker::PhoneNumber.cell_phone,
  address:Faker::Address.full_address,
  fax:Faker::PhoneNumber.cell_phone,
  website_url:Faker::Internet.domain_name
)

end


hiring_managers.each do |h|
  rand(1..10).times {
    job_listing << JobListing.create(
      title: "Seeking #{Faker::Company.profession}",
      start_date: Faker::Date.forward(360),
      duration:"#{rand(2..12)} Months",
      description:Faker::Lorem.paragraph,
      hiring_manager_id: h.id
    )
  }
end


job_seekers.each do |j|
  rand(3..10).times {
   JobApplication.create(
    job_seeker_id: j.id,
    job_listing_id: job_listing.sample.id
   )
  }
end

