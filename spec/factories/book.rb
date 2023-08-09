# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    isbn { '456124' }
    title { 'Algorithms to Live By: The Computer Science' }
    authors { 'Brian Christian, Tom Griffiths, Thomas L. Griffiths' }
    language { 'English' }
    edition { 'first' }
    subject { 'Computer' }
    # library_id { FactoryBot.create(:library) }
    library_id { FactoryBot.create(:library).id }
    # library_id {1}
  end
end
