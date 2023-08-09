# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_230_808_073_920) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'books', force: :cascade do |t|
    t.string 'isbn'
    t.string 'title'
    t.string 'authors'
    t.string 'language'
    t.string 'edition'
    t.string 'subject'
    t.bigint 'library_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['library_id'], name: 'index_books_on_library_id'
  end

  create_table 'checkouts', force: :cascade do |t|
    t.bigint 'student_id', null: false
    t.bigint 'book_id', null: false
    t.date 'issue_date'
    t.date 'return_date'
    t.boolean 'checkout'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['book_id'], name: 'index_checkouts_on_book_id'
    t.index ['student_id'], name: 'index_checkouts_on_student_id'
  end

  create_table 'libraries', force: :cascade do |t|
    t.string 'name'
    t.string 'university'
    t.string 'location'
    t.integer 'borrow_limit'
    t.float 'overdue_fines'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'students', force: :cascade do |t|
    t.string 'email'
    t.string 'name'
    t.string 'password'
    t.string 'education_level'
    t.string 'university'
    t.integer 'max_book_allowed'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'books', 'libraries'
  add_foreign_key 'checkouts', 'books'
  add_foreign_key 'checkouts', 'students'
end
