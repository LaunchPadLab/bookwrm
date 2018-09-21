FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author

    trait :complete do
      description Faker::Lorem.sentence(3, true, 4)
      isbn { Faker::Code.isbn }
      genre { Faker::Book.genre }
      publish_date { Faker::Date.birthday(18, 65) }
      num_pages { Faker::Number.number(3) }
    end

    trait :with_favorites do
    end

    trait :with_reviews do
    end
  end
end
