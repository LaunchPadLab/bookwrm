module Seeds
  class Seeder
    class << self
      NUM_USERS = 3

      def seed
        puts 'cleaning old data...'
        clean_db
        puts 'creating users...'
        create_users
        # puts 'creating authors and books...'
        # create_authors
        # create_books
        # puts 'adding reviews...'
        # create_reviews
        puts 'done'
      end

      private

      def clean_db
        tables.each { |table| table.constantize.destroy_all }
      end

      def tables
        %w(User)
      end

      def create_users
        users = Array.new(NUM_USERS) do |n|
          {
            first_name: "User #{n}",
            last_name: 'Smith',
            email: "user_#{n}@example.com",
            password: 'password',
            password_confirmation: 'password'
          }
        end
        User.create(users)
      end
    end
  end
end
