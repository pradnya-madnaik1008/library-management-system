# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :authors
      t.string :language
      t.string :edition
      t.string :subject
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
