# frozen_string_literal: true

module SeedGenerator
  class Users < Base
    def work_sheet_name
      'Users'
    end

    def model
      User
    end

    def generate_records_properties
      records_properties = []
      @row_size.times do |r|
        properties_hash = {}
        @column_size.times do |c|
          if avatars_column?(c)
            properties_hash[:avatars] = []
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

    def avatars_column?(column_number)
      column_number == 2
    end
  end
end
