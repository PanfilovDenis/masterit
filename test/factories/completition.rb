# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :completition do
    name 'MyString'
    tour
    year '2013'
    
    after(:create) do |p|
      p.publish
    end
  end
end
