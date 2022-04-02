# frozen_string_literal: true

class UserValidator < ActiveModel::Validator
  ALLOWED_KEY = %w[main storage_path].freeze

  def validate(record)
    record.avatars.each do |avatar|
      @avatar = avatar
      if avatar_additional_keys? || !demand_keys?
        return record.errors.add(:avatars, "should have fields: #{ALLOWED_KEY} but got: #{@avatar.keys}")
      end

      unless correct_types?
        return record.errors.add(
          :avatars,
          "main should be Boolean, storage_path should be String but got
            main: #{@avatar['main'].class}, storage_path: #{@avatar['storage_path'].class}"
        )
      end
    end
  end

  private

  def avatar_additional_keys?
    (@avatar.keys - ALLOWED_KEY).present?
  end

  def demand_keys?
    ALLOWED_KEY.each do |allowed_key|
      return false unless @avatar.keys.include?(allowed_key)
    end

    true
  end

  def correct_types?
    @avatar['main'].in?(%w[true false]) && @avatar['storage_path'].is_a?(String)
  end
end
