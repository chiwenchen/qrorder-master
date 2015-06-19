# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

asia_food = Restaurant.create(name: 'Asian Food')
salad = Restaurant.create(name: 'Happy Salad')

chicken_with_cashew_nuts = Menu.create(
  dish_name: 'Chicken with Cashew Nuts', 
  description: 'some description',
  photo: '/img/chicken-with-cashew-nuts.jpg', 
  restaurant: asia_food)

green_chicken_curry = Menu.create(
  dish_name: 'Green Chicken Curry', 
  description: 'some description',
  photo: '/img/green-chicken-curry.jpg', 
  restaurant: asia_food)

khao_pad = Menu.create(
  dish_name: 'Khao Pad', 
  description: 'some description',
  photo: '/img/khao-pad.jpg', 
  restaurant: asia_food)

pad_pak_boong = Menu.create(
  dish_name: 'Pad Pak Boong', 
  description: 'some description',
  photo: '/img/pad-pak-boong.jpg', 
  restaurant: asia_food)

pad_thai = Menu.create(
  dish_name: 'Pad Thai', 
  description: 'some description',
  photo: '/img/pad-thai.jpg', 
  restaurant: asia_food)

red_curry = Menu.create(
  dish_name: 'Red Curry', 
  description: 'some description',
  photo: '/img/red-curry.jpg', 
  restaurant: asia_food)

somtam = Menu.create(
  dish_name: 'Somtam', 
  description: 'some description',
  photo: '/img/somtam.jpg', 
  restaurant: asia_food)

spicy_beef_salad = Menu.create(
  dish_name: 'Spicy Beef Salad', 
  description: 'some description',
  photo: '/img/spicy-beef-salad.jpg', 
  restaurant: asia_food)

tom_kha_kai = Menu.create(
  dish_name: 'Tom Kha Kai', 
  description: 'some description',
  photo: '/img/tom-kha-kai.jpg', 
  restaurant: asia_food)

TB1 = Table.create(
  restaurant: asia_food,
  number: 1,
  )

admin = User.create(
  name: 'admin',
  password: 'admin',
  role: "Admin",
  restaurant: asia_food,
  )

admin = User.create(
  name: 'otto',
  password: '123',
  role: "Manager",
  restaurant: asia_food,
  )

admin = User.create(
  name: 'kim',
  password: '123',
  role: "Chef",
  restaurant: asia_food,
  )

