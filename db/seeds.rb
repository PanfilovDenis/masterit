# Encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(email: configus.admin.email, password: configus.admin.password)
Expert.create(first_name: 'Expert', last_name: 'Expert', patronymic: "Expert", email: "expert@yandex.ru", password: '12345678')
Moderator.create(first_name: 'Moderator', last_name: 'Moderator', patronymic: "Moderator", email: 'moderator@yandex.ru', password: '12345678')
Participant.create(first_name: 'User', last_name: 'User', patronymic: "User", email: 'participant@yandex.ru', password: '12345678')
work_nominations = ["Тематический сайт","2-мерная статичная графика","3-мерная статичная графика",
"Анимационный ролик - 2-х мерная графика", "Анимационный ролик - 3-х мерная графика", "Электронные учебные пособия",
"Презентация в программе  PowerPoint","Презентация с использованием программ (Flash, Movie Maker и т.п)",
"Программное творчество"," Компьютерные игры", "Видеомонтаж, видеосъемка", "Музыка",
"Защита информации - номинация от лаборатории Касперского", "Свободное программное обеспечение (работы, выполненные на СПО)",
"IT-интеграция – номинация, объединяющая не менее трех  побед в разных номинациях (для выдающихся участников)",
"Реклама к юбилею Конкурса (видеоролики, графика и т.д.)"]
work_nominations.each { |work_nomination| WorkNomination.create(name: work_nomination) }
works = []
works <<  Work.create(name: "work", description: "describtion")
works << Work.create(name: "new_work", description: "new_describtion")
works << Work.create(name: "new_new_work", description: "new_new_describtion")
competition = Competition.new
competition.year = Time.current.year
competition.name = "MasterIT 2013"
competition.save!
regions = ['Заволжский', 'Ленинский', 'Железнодорожный', 'Засвияжский']
regions.each{|region| Region.new(name: region).save!}
region = Region.find_by_name('Ленинский')
region.works = works
region.save!
m = MenuItem.create(title: "Главная")
p = m.pages.create(title: "Добро пожаловать на Мастер-ИТ!", body: "Добро пожаловать на Мастерит! Если ты админ, зайди в админку и исправь главную страницу")
p.publish
