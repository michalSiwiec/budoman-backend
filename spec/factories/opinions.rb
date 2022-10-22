# frozen_string_literal: true

FactoryBot.define do
  factory :opinion do
    content { 'MyText' }
    mark { 1 }
    user { nil }
  end
end
