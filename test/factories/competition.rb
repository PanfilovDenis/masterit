# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :competition do
    name 'MyString'
    year '2013'
    after(:create) do |competition|
      competition.tours << FactoryGirl.build(:tour, competition: competition)
      competition.start
    end
  end
end
