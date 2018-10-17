FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author

    trait :complete do
      description { Faker::Lorem.sentence(3, true, 4) }
      isbn { Faker::Code.isbn }
      genre { Faker::Book.genre }
      publish_date { Faker::Date.birthday(18, 65) }
      num_pages { Faker::Number.number(3) }
    end

    trait :with_reviews do
      after(:create) do |book|
        2.times { |n| FactoryBot.create(:review, book: book, rating: (n + 1)) }
      end
    end
  end
end
