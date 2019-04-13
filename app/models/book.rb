# frozen_string_literal: true

class Book < ApplicationRecord
  # Relations
  belongs_to :user
  has_many :assigned_to_users, class_name: 'AssignedBook'

  # Scopes
  scope :all_public, -> { where(public: true).map { |book| book_to_json(book) }.to_json }

  # Methods
  def self.book_to_json(book)
    {
      id: book.id,
      title: book.title,
      author: book.author,
      pages: book.pages
    }
  end
end
