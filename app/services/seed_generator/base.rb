# frozen_string_literal: true

module SeedGenerator
  class Base < BaseService
    def initialize
      super()
      @work_sheet = workbook[work_sheet_name]
      @row_size = count_row
      @column_size = count_column
    end

    def call
      create_records
    end

    private

    def workbook
      RubyXL::Parser.parse('app/services/seed_generator/Seeds.xlsx')
    end

    def work_sheet_name
      raise NotImplementedError, 'work_sheet_name has to be defined!'
    end

    def count_row
      counter = 0
      loop do
        break unless @work_sheet[counter + 1].present?

        counter += 1
      end
      counter
    end

    def count_column
      counter = 0
      loop do
        column_value = @work_sheet[0][counter]&.value
        break unless column_value.present?

        counter += 1
      end
      counter
    end

    def model
      raise NotImplementedError, 'model_name has to be defined!'
    end

    def record_attribute
      rejected_attributes = %w[id created_at updated_at]
      model.attribute_names.reject { |attr| rejected_attributes.include?(attr) }
    end

    def generate_records_properties
      raise NotImplementedError, 'generate_record_properties has to be defined!'
    end

    def create_records
      generate_records_properties.each do |record_properties|
        model.find_or_create_by!(record_properties)
      end
    end
  end
end
