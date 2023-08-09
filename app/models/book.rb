# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :library
  has_many :checkouts
end
