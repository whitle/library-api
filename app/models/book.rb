class Book < ApplicationRecord
  belongs_to :user
  has_many :assigned_to_users, class_name: 'AssignedBook' 
end
