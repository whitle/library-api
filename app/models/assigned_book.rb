# frozen_string_literal: true

class AssignedBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :book_progresses
end
