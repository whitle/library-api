class CreateAssignedBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :assigned_books do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :pages_read
      t.date    :date_of_reading

      t.timestamps
    end
  end
end
