# frozen_string_literal: true

class CreateAssignedBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :assigned_books do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
