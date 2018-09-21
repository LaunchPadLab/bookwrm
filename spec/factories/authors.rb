FactoryBot.define do
  factory :author do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
  end
end
