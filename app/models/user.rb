# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # Relations
  has_many :books
  has_many :assigned_books
  has_many :assigned_books_list, through: :assigned_books, source: :book
end
