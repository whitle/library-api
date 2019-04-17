# frozen_string_literal: true

class Book < ApplicationRecord
  # Relations
  belongs_to :user
  has_many :assigned_to_users, class_name: 'AssignedBook'
end
