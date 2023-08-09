# frozen_string_literal: true

class Checkout < ApplicationRecord
  belongs_to :book
  belongs_to :student
end
