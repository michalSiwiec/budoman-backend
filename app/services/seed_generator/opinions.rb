# frozen_string_literal: true

module SeedGenerator
  class Opinions < Base
    def work_sheet_name
      'Opinions'
    end

    def model
      Opinion
    end

    def generate_records_properties
      records_properties = []
      @row_size.times do |r|
        properties_hash = {}
        @column_size.times do |c|
          if user_column?(c)
            properties_hash[:user_id] = user_id(row_number: r, column_number: c)
          else
            column_name = @work_sheet[0][c].value
            column_value = @work_sheet[r + 1][c].value
            properties_hash[column_name] = column_value
          end
        end
        records_properties << properties_hash
      end
      records_properties
    end

    def user_column?(column_number)
      column_number == 2
    end

    def user_id(row_number:, column_number:)
      user_email = @work_sheet[row_number + 1][column_number].value
      User.find_by(email: user_email).id
    end
  end
end
