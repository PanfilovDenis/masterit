class ImportDb

  # INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, 
  #`NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`,
  # `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`,
  #  `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, 
  #  `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, 
  #  `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, 
  #  `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`,
  #   `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`,
  #    `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`,
  #     `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`) 

  def self.import_users
    users = File.open("lib/users.txt")
    users = users.map {|line| line.split(',')}
    users.each do |user|
      u = User.first_or_initialize(email: user[2])
      u.password = SecureRandom.hex(8)
      u.encrypted_password = user[3]
      u.first_name =  user[6]
      u.last_name = user[7]
      u.patronymic = user[51]
      u.type = "Participant"
      u.save!
      u.inspect
    end
  end

  def self.import_works
    works = File.open("lib/works.txt")
    works = works.map {|line| line.split(',')}
    works.each do |work|
      w = Work.first_or_initialize(region_id: work[41].to_i)
      w.user = User.find_by_email(work[51])
      w.save!
    end
  end
  #parse_users(2) email
  #parse_users(3) password (ssl)
  #parse_users(6) name
  #parse_users(7) last_name
  #parse_users(13) vk_url
  #parse_users(18) phone
  #parse_users(51) отчество

  # parse_works(1) - список фамилий участников и т д
  # 1 Фамилия первого участника
  # 3 Имя первого участника
  # 5 Отчество первого участника
  #  Фамилия 2ого участника
  #  Имя 2ого участника
  #  Отчество 2ого участника
  #  Фамилия 3ого участника
  #  Имя 3ого участника
  #  Отчество 3ого участника
  #  Фамилия первого руководителя
  #  Имя первого руководителя
  #  Отчество первого руководителя
  #  Фамилия 2ого руководителя
  #  Имя 2ого руководителя
  #  Отчество 2ого руководителя
  # ?? Номинация
  # ?? Тур
  # 35 Ссылка на работу
  # 37 Ссылка на видео
  # 41 Регион
  # 43 Муниципальное образование
  # ?? Муниципальное общеобразовательное учреждение
  # 45 Класс
  # 47 Дата Рождения
  # 49 Контактный телефон
  # 51 емайл
  # 27 Район Города
  # 55 ID видео на ютубе
  # ?? Сертификат
  # ?? Архивы с исходниками
  # ?? Ссылка на сайт
end

