# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin_user = User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)

admin_user.books.create!(
  [
    { title: 'A Tale of Two Cities', author: 'Charles Dickens', pages: 341 },
    { title: 'The Lord of the Rings', author: 'J. R. R. Tolkien', pages: 341 },
    { title: 'The Little Prince', author: 'Antoine de Saint-Exuper', pages: 140 },
    { title: 'The Hobbit', author: 'J.R.R. Tolkien', pages: 310 },
    { title: 'The Adventures of Sherlock Holmes', author: 'Arthur Conan Doyle', pages: 240 }
  ]
)

user = User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')

user.assigned_books.create!(
  [
    { book: Book.first },
    { book: Book.second }
  ]
)

user.assigned_books.first.book_progresses.create!(
  [
    { date_of_reading: '2019-03-20', pages_read: 10 },
    { date_of_reading: '2019-03-20', pages_read: 20 },
    { date_of_reading: '2019-03-21', pages_read: 25 },
    { date_of_reading: '2019-03-22', pages_read: 15 }
  ]
)

