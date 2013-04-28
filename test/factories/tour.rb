# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tour do
    name
    after(:create) do |p|
      p.publish
    end
  end
end
