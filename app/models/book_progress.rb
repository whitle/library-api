# frozen_string_literal: true

class BookProgress < ApplicationRecord
  # Relations
  belongs_to :assigned_book

  # Validations
  validates :date_of_reading, presence: true
  validates :pages_read, presence: true, numericality: { only_integer: true }
end
