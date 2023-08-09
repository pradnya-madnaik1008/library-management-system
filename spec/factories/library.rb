# frozen_string_literal: true

FactoryBot.define do
  factory :library do
    name { 'Joe and Rika Mansueto Library' }
    university { 'University of Chicago' }
    location { 'Hyde Park, Chicago, Illinois' }
    borrow_limit { 20 }
    overdue_fines { 20 }
  end
end
