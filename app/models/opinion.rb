# frozen_string_literal: true

class Opinion < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :mark, inclusion: { in: 1..5 }
end
