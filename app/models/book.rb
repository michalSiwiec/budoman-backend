# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true

  has_many :authors
end
