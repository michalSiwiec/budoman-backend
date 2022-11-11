# frozen_string_literal: true

class User < ApplicationRecord
  PASSWORD = /\A(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}\z/i.freeze

  has_secure_password

  validates :email,
            uniqueness: { message: 'is already taken!' },
            format: { with: REGEX[:email], message: 'has incorrect format!' }

  # validates :password, format: { with: PASSWORD,
  #                                message: 'must be at least 6 characters and include one number and one letter.' }

  validates_with UserValidator, fields: [:avatars]

  has_many :opinions, dependent: :destroy
  has_many :orders, dependent: :destroy
end
