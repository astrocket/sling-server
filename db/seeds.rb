# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
manager = User.create(email: 'manager@sling.com', password: 'gksruf', password_confirmation: 'gksruf')
manager.add_role :manager
user = User.create(email: 'user@sling.com', password: 'gksruf', password_confirmation: 'gksruf' )
user.add_role :member
g = Group.create(manager: manager, name: 'Sling', category: 'Sports')

g.users << user
g.save

puts "groups users : #{g.users}\n"
puts "group's manager : #{g.manager}\n"
puts "user's groups : #{user.groups}\n"
puts "managing groups : #{manager.managing_groups}\n"
