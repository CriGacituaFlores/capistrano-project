# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [
  { email: 'thomas@example.com', first_name: 'Thomas', last_name: 'Bush', admin: true },
  { email: 'bear@example.com', first_name: 'Bear', last_name: 'Bush', admin: true },
]

users.each do |user|
  this_user = User.where(email: user[:email]).first_or_initialize

  this_user.update!(
    first_name: user[:first_name],
    last_name: user[:last_name],
    admin: user[:admin],
    password: SecureRandom.uuid
  )
  this_user.save
end