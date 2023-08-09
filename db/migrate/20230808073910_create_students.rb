# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :email
      t.string :name
      t.string :password
      t.string :education_level
      t.string :university
      t.integer :max_book_allowed

      t.timestamps
    end
  end
end
