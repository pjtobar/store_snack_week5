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
								    email: 'pablo.admin@gmail.com',
								    password: 'pabloth',
								    password_confirmation: 'pabloth')
user1.add_role(:admin)
user2 = User.create(username: 'Bruce',
								    email: 'pablo.tobar711@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user2.add_role(:client)
user3 = User.create(username: 'Javier',
								    email: 'client2@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user3.add_role(:client)
user4 = User.create(username: 'Aracely',
								    email: 'client3@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user4.add_role(:client)
user5 = User.create(username: 'Diego',
								    email: 'client4@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user5.add_role(:client)
user6 = User.create(username: 'Rodrigo',
								    email: 'client5@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user6.add_role(:client)
user7 = User.create(username: 'Eve',
								    email: 'client6@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user7.add_role(:client)
user8 = User.create(username: 'Gabriel',
								    email: 'client7@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user8.add_role(:client)
user9 = User.create(username: 'Karla',
								    email: 'client8@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user9.add_role(:client)
user10 = User.create(username: 'Daniel',
								    email: 'client9@gmail.com',
								    password: '12346789',
								    password_confirmation: '12346789')
user10.add_role(:client)

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
