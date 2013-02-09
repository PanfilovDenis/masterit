masterit
========
[![Build Status master](https://travis-ci.org/PanfilovDenis/masterit.png?branch=master)](https://travis-ci.org/PanfilovDenis/masterit)
[![Build Status develop](https://travis-ci.org/PanfilovDenis/masterit.png?branch=develop)](https://travis-ci.org/PanfilovDenis/masterit)

Учебный Центр "Мастер ИТ" УлГТУ

## Installation and running way
```sh
  git clone https://github.com/PanfilovDenis/masterit.git
  cd masterit
  bundle install
  bundle exec rake db:create db:migrate db:seed
  bundle exec rails s
```

  Теперь в браузере можно будет открыть сайт, по умолчанию он находится
по ссылке http://localhost:3000/