# frozen_string_literal: true

class CreateBookProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :book_progresses do |t|
      t.integer :assigned_book_id
      t.integer :pages_read
      t.date    :date_of_reading

      t.timestamps
    end
  end
end
