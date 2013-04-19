# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work_nomination do
    name
    
    after(:create) do |p|
      p.publish
    end
  end
end
