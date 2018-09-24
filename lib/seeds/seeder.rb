module Seeds
  class Seeder
    class << self
      NUM_USERS = 3
      NUM_AUTHORS = 10

      def seed
        puts 'cleaning old data...'
        clean_db
        puts 'creating users...'
        create_users
        puts 'creating authors and books...'
        create_authors
        create_books
        puts 'adding favorites and reviews...'
        create_favorites
        create_reviews
        puts 'done'
      end

      private

      def clean_db
        tables.each { |table| table.constantize.destroy_all }
      end

      def tables
        %w(Favorite Review Book Author User)
      end

      def create_users
        users_arr = Array.new(NUM_USERS) do |n|
          {
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.first_name,
            email: "user_#{n}@example.com",
            password: 'password',
            password_confirmation: 'password'
          }
        end
        @users = User.create!(users_arr)
      end

      def create_authors
        authors_arr = Array.new(NUM_AUTHORS) do
          {
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.first_name,
          }
        end
        @authors = Author.create!(authors_arr)
      end

      def create_books
        books_arr = @authors.map { |author| FactoryBot.attributes_for(:book, :complete).merge(author: author) }
        @books = Book.create!(books_arr)
      end

      def create_favorites
        favorites_arr = @users.flat_map do |user|
          Array.new(3) do
            {
              user: user,
              book: @books.sample
            }
          end
        end
        Favorite.create!(favorites_arr)
      end

      def create_reviews
        reviews_arr = @users.flat_map do |user|
          Array.new(3) do
            {
              rating: (1..5).to_a.sample,
              description: Faker::Lorem.sentence(3, true, 4),
              user: user,
              book: @books.sample
            }
          end
        end
        Review.create!(reviews_arr)
      end
    end
  end
end
