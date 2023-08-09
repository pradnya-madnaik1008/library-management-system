# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    email { 'john@gmail.com' }
    name { 'John Ray' }
    password { 'john@123' }
    university { 'University of Chicago' }
    max_book_allowed { 5 }
  end
end
