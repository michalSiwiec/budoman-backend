# frozen_string_literal: true

class UserValidator < ActiveModel::Validator
  ALLOWED_KEY = %w[main bucket key].freeze

  def validate(record)
    return record.errors.add(:avatars, 'should be Array type!') unless record.avatars.is_a?(Array)

    record.avatars.each do |avatar|
      return record.errors.add(:avatars, "should contain exactly: #{ALLOWED_KEY.join(' ,')} keys, contains: #{avatar.keys.join(' ,')}") unless contains_only_required_fields?(avatar: avatar)
      return record.errors.add(:avatars, 'main should be boolean type, storage_path should be string type!') unless contains_correct_types?(avatar: avatar)
    end
  end

  private

  def contains_only_required_fields?(avatar:)
    avatar.keys.sort == ALLOWED_KEY.sort
  end

  def contains_correct_types?(avatar:)
    avatar['bucket'].is_a?(String) && avatar['key'].is_a?(String) && avatar['main'].in?(%w[true false])
  end
end
