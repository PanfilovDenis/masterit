Factorygirl.define do
  factory :competition do
    year :integer
    published_at { generate :date }
  end
end
