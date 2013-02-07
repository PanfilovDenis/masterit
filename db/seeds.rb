# Encoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@admin.ru", password: "admin@admin.ru", role: "admin")
Competition.create(year: 2013)
Competition.create(year: 2012)
tours = ["Школьный", "Муниципальный", "Областной"]
tours.each{|tour| Tour.create(name: tour)}
