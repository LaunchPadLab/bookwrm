FactoryBot.define do
  factory :review do
    rating { (1..5).to_a.sample }
    description { Faker::Lorem.sentence(3, true, 4) }
    book
    user
  end
end
