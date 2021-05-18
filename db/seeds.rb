# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Faker::Config.locale = 'fr'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

20.times do
    u = User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Name.first_name+'@yopmail.com',
        description: Faker::Lorem.paragraph_by_chars(number: 20, supplemental: false),
        encrypted_password: Faker::Internet.password(min_length: 6, max_length: 20)
    )
    u.errors.messages
  end
  
  puts "Les users ont été crées"

15.times do
  e = Event.create(
      title: Faker::Lorem.paragraph_by_chars(number: rand(6..20)), 
      start_date: Faker::Date.forward(days: 30), 
      duration: [5,10,20,30].sample, 
      description: Faker::Lorem.paragraph_by_chars(number: rand(100..200)),
      price: Faker::Number.between(from: 1, to: 1000),
      location: Faker::Lorem.word,
      #admin: User.all.sample
    )
  end

  puts "Les events ont été crées"

10.times do
   a = Attendance.create(
    stripe_customer_id: Faker::Number.number(digits: 10),
    user: User.all.sample,
    event: Event.all.sample 
  )
  a.errors.messages
end

  puts "Les participations ont été crées"

  