# frozen_string_literal: true

FactoryBot.define do
  factory :checkout do
    student_id { FactoryBot.create(:student).id }
    book_id { FactoryBot.create(:book).id }
    issue_date { Date.today }
    return_date { Date.today + 10.days }
    checkout { false }
  end
end
