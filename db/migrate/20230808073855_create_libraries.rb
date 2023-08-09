# frozen_string_literal: true

class CreateLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :university
      t.string :location
      t.integer :borrow_limit
      t.float :overdue_fines

      t.timestamps
    end
  end
end
