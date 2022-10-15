# frozen_string_literal: true

class User < ApplicationRecord
  EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  PASSWORD = /\A(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}\z/i.freeze

  validates :email,
            uniqueness: { message: 'is already taken!' },
            format: { with: EMAIL, message: 'has incorrect format!' }

  validates :password,
            format: { with: PASSWORD, message: 'must be at least 6 characters and include one number and one letter.' }

  validates_with UserValidator, fields: [:avatars]

  has_many :opinions
  has_many :orders
end
