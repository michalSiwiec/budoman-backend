class AddConstraintsForUsers < ActiveRecord::Migration[5.2]
  LENGTH_CHECK_FIELDS = %i[email name surname phone_number street city postal_code].freeze

  def up
    change_column_null :users, :email, false
    change_column_null :users, :password_digest, false

    LENGTH_CHECK_FIELDS.each do |field|
      execute <<-SQL
        ALTER TABLE users
        ADD CONSTRAINT #{field}_length_check
        CHECK (length(#{field}) > 0);
      SQL
    end
  end

  def down
    change_column_null :users, :email, true
    change_column_null :users, :password_digest, true

    LENGTH_CHECK_FIELDS.each do |field|
      execute <<-SQL
        ALTER TABLE users
        DROP CONSTRAINT #{field}_length_check;
      SQL
    end
  end
end
