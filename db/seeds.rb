# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

books = Book.create([{ title: 'Book 1', description: 'A really cool place.', price: 16.99 }, { title: 'Book 2', description: 'A really cool place.', price: 16.99}])
guides = Guide.create([{ title: 'Guide 1', description: 'A really cool place.', price: 5.99}, { title: 'Guide 2', description: 'A really cool place.', price: 5.99},{ title: 'Guide 3', description: 'A really cool place.', price: 5.99}])
admin = User.create([{email: 'kenrettberg@gmail.com', password: 'password', password_confirmation: 'password', admin: 'true'}])