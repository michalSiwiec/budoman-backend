class UserValidator < ActiveModel::Validator
  ALLOWED_KEY = %w[main storage_path]

  def validate(record)
    record.avatars.each do |avatar|
      @avatar = avatar

      if (has_avatar_additional_keys? || !has_demand_keys?)
        record.errors.add(:avatars, "should have fields: #{ALLOWED_KEY} but got: #{@avatar.keys}")
        return
      end

      if (!has_correct_types?)
        record.errors.add(
          :avatars,
          "main should be Boolean, storage_path should be String but got
            main: #{@avatar['main'].class}, storage_path: #{@avatar['storage_path'].class}"
        )
        return
      end
    end
  end

  private

  def has_avatar_additional_keys?
    (@avatar.keys - ALLOWED_KEY).present?
  end

  def has_demand_keys?
    ALLOWED_KEY.each do |allowed_key|
      return false unless @avatar.keys.include?(allowed_key)
    end

    return true
  end

  def has_correct_types?
    @avatar['main'].in?(['true', 'false']) && @avatar['storage_path'].is_a?(String)
  end
end
