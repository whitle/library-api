# frozen_string_literal: true

class Book < ApplicationRecord
  # Relations
  has_many :assigned_books
  has_many :users, through: :assigned_books

  # Validations
  validates :title, :author, :pages, presence: true
end
