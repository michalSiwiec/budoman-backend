class Book < ApplicationRecord
  validates :title, presence: true

  has_many :authors
end
