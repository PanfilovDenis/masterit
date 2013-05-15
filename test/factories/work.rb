FactoryGirl.define do
  factory :work do
    description {generate :string}
    image  {generate :string}
    name  {generate :string}
    user {user_id if user_id}
  end
end