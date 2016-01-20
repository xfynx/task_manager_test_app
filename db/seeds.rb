# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create([{name: 'admin'}, {name: 'user'}])

admin = User.new({email: 'admin@example.com', full_name: 'admin', password: '12345678'})
admin.add_role('admin')
admin.save!

user1 = User.new({email: 'user1@example.com', full_name: 'User One The Great', password: '12345678'})
user1.add_role('user')
user1.save!

user2 = User.new({email: 'user2@example.com', full_name: 'User Two The Choosen One', password: '12345678'})
user2.add_role('user')
user2.save!

task1 = Task.create({name: 'Task1'})
task2 = Task.create({name: 'Task2', user: user1})
task3 = Task.create({name: 'Task3', user: user2})

task2.run
task2.save!
task3.finish
task3.save!