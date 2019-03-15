# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create(name: :admin)
Role.create(name: :client)
user1 = User.create(username: 'pabloth',
								    email: 'pablo.tobar711@gmail.com',
								    password: 'pabloth',
								    password_confirmation: 'pabloth')
user1.add_role(:admin)
user2 = User.create(username: 'Bruce',
								    email: 'client1@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user2.add_role(:client)
user3 = User.create(username: 'Javier',
								    email: 'client2@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user3.add_role(:client)
user4 = User.create(username: 'Javier',
								    email: 'client3@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user4.add_role(:client)

cat = []
20.times do
	cat << Category.create(name: Faker::Dessert.topping)
end

70.times do
	Product.create(name: Faker::Music::RockBand.name,
								 price: rand(1.00..20.00).round(2),
								 stock: rand(0..50),
								 sku: Faker::Number.hexadecimal,
								 category: cat.sample,
							 	 state: 1)
end
