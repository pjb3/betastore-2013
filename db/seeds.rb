# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clothing = Category.create!(name: 'Clothing')
stuff = Category.create!(name: 'Stuff')

clothing.products << Product.create!(name: 'Hat', price: 14.99)
clothing.products << Product.create!(name: 'Hoodie', price: 22.99)
stuff.products << Product.create!(name: 'iPhone Case', price: 9.99)
stuff.products << Product.create!(name: 'Journal', price: 12.99)
clothing.products << Product.create!(name: 'Shirt', price:  17.99)
stuff.products << Product.create!(name: 'Sticker', price: 2.99)

