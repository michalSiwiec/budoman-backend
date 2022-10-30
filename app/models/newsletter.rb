# frozen_string_literal: true

class Newsletter < ApplicationRecord
  validates :email, :name, :surname, presence: true
  validates :email,
            uniqueness: { message: 'is already taken!' },
            format: { with: REGEX[:email], message: 'has incorrect format!' }
end
