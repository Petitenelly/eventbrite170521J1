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


  t1 = Time.parse("2021-05-18 20:40:34")
  t2 = Time.parse("2022-01-01 00:00:00")

  6.times do |x|
    Event.create(
    start_date: rand(t1..t2),
    duration: rand(5..100)*5,
    description: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false),
    location: Faker::Address.city,
    price: rand(1..100),
    title: Faker::Book.title)
  
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

  