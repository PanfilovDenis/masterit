# Encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: configus.admin.email, password: configus.admin.password, role: configus.admin.role)
tours = ["Школьный", "Муниципальный", "Областной"]
work_nominations = ["Тематический сайт","2-мерная статичная графика","3-мерная статичная графика",
"Анимационный ролик - 2-х мерная графика", "Анимационный ролик - 3-х мерная графика", "Электронные учебные пособия",
"Презентация в программе  PowerPoint","Презентация с использованием программ (Flash, Movie Maker и т.п)",
"Программное творчество"," Компьютерные игры", "Видеомонтаж, видеосъемка", "Музыка",
"Защита информации - номинация от лаборатории Касперского", "Свободное программное обеспечение (работы, выполненные на СПО)",
"IT-интеграция – номинация, объединяющая не менее трех  побед в разных номинациях (для выдающихся участников)",
"Реклама к юбилею Конкурса (видеоролики, графика и т.д.)"]
tours.each { |tour| Tour.create(name: tour)}
work_nominations.each { |work_nomination| WorkNomination.create(name: work_nomination) }
m = MenuItem.create(title: "Главная")
p = m.pages.create(title: "Добро пожаловать на Мастер-ИТ!", body: "Добро пожаловать на Мастерит! Если ты админ, зайди в админку и исправь главную страницу")
p.publish
