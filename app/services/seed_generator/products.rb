# frozen_string_literal: true

module SeedGenerator
  class Products < Base
    private

    def work_sheet_name
      'Products'
    end

    def model
      Product
    end

    def generate_records_properties
      records_properties = []
      @row_size.times do |r|
        properties_hash = {}

        @column_size.times do |c|
          if product_cathegory_column?(c)
            properties_hash[:product_cathegory_id] = product_cathegory_id(row_number: r, column_number: c)
          else
            column_value = @work_sheet[r + 1][c]&.value
            column_name = @work_sheet[0][c].value
            properties_hash[column_name] = column_value
          end
        end
        records_properties << properties_hash
      end
      records_properties
    end

    def product_cathegory_column?(column_number)
      column_number == 4
    end

    def product_cathegory_id(row_number:, column_number:)
      product_cathegory_name = @work_sheet[row_number + 1][column_number].value
      ProductCathegory.find_by(name: product_cathegory_name).id
    end
  end
end
