# frozen_string_literal: true

module SeedGenerator
  class ProductCathegories < Base
    private
  
    def work_sheet_name
      'ProductsCathegories'
    end
  
    def model
      ProductCathegory
    end
  
    def generate_records_properties
      records_properties = []
      @row_size.times do |r|
        properties_hash = {}
  
        @column_size.times do |c|
          column_value = @work_sheet[r + 1][c].value
          column_name = @work_sheet[0][c].value
          properties_hash[column_name] = column_value
        end
        records_properties << properties_hash
      end
      records_properties
    end
  end
end
