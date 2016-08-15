# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
REQUESTS_TO_GENERATE = 1000
departments = ["Sales","Marketing","Technical"]

REQUESTS_TO_GENERATE.times do
  Request.create name:      Faker::Name.name,
                  email:       Faker::Internet.email,
                  department: departments[rand(3)],
                  message: Faker::Lorem.paragraphs(1)
end
