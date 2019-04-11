# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  admin_user = User.new(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)

  admin_user.books.build(
    [
      { title: 'A Tale of Two Cities', author: 'Charles Dickens', pages: 341, public: true },
      { title: 'The Lord of the Rings', author: 'J. R. R. Tolkien', pages: 341, public: true },
      { title: 'The Little Prince', author: 'Antoine de Saint-Exuper', pages: 140, public: true },
      { title: 'The Hobbit', author: 'J.R.R. Tolkien', pages: 310, public: true },
      { title: 'The Adventures of Sherlock Holmes', author: 'Arthur Conan Doyle', pages: 240, public: true }
    ]
  )
  admin_user.save

  user = User.new(email: 'user@example.com', password: 'password', password_confirmation: 'password')
  user.assigned_books.build(
    [
      { book_id: 1, date_of_reading: '2019-03-20', pages_read: 10 },
      { book_id: 2, date_of_reading: '2019-03-20', pages_read: 20 },
      { book_id: 2, date_of_reading: '2019-03-21', pages_read: 25 },
      { book_id: 1, date_of_reading: '2019-03-22', pages_read: 15 }
    ]
  )
  user.save
end
