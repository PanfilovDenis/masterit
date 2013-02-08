# Encoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@admin.ru", password: "admin@admin.ru", role: "admin")
competitions = []
(2013..2019).each{|y| competitions.push Competition.create(year: y)}
tours = ["Школьный", "Муниципальный", "Областной"]
tour_objects = []
tours.each{|tour| tour_objects.push Tour.create(name: tour)}
tour_objects.first.competitions = competitions
tour_objects.last.competitions = competitions
