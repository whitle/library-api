# frozen_string_literal: true

class BookProgress < ApplicationRecord
  belongs_to :assigned_book
end
