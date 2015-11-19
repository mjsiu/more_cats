# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(user_name: "Mack", password: "password")
User.create(user_name: "Claire", password: "password123")

Cat.create(birth_date: '01 Jan 2014', color: 'BLACK', name: 'ClaireClaire', sex: 'F', description: "i don't care", user_id: 5)
