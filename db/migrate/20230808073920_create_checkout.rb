# frozen_string_literal: true

class CreateCheckout < ActiveRecord::Migration[6.1]
  def change
    create_table :checkouts do |t|
      t.references :student, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :issue_date
      t.date :return_date
      t.boolean :checkout

      t.timestamps
    end
  end
end
