# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  { name: 'Hat', price: 14.99 },
  { name: 'Hoodie', price: 22.99 },
  { name: 'iPhone Case', price: 9.99 }, 
  { name: 'Journal', price:  12.99 },
  { name: 'Shirt', price:  17.99 },
  { name: 'Sticker', price: 2.99 }
].each do |attrs|
  Product.create!(attrs)
end