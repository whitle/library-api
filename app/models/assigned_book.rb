# frozen_string_literal: true

class AssignedBook < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :book
  has_many :book_progresses
end
