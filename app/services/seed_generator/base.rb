# frozen_string_literal: true

module SeedGenerator
  class Base < BaseService
    WORK_BOOK_PATH = 'app/services/seed_generator/Seeds.xlsx'
    COLUMN_NAME_ROW_INDEX = 0
    COLUMN_NAME_Y_OFFSET = 1

    def initialize
      super()
      @work_sheet = workbook[self.class::SHEET_NAME]
    end

    def call
      create_records
    end

    private

    def workbook
      RubyXL::Parser.parse(WORK_BOOK_PATH)
    end

    def create_records
      generate_records_attributes.each { |attr| self.class::MODEL.find_or_create_by!(attr) }
    end

    def generate_records_attributes
      raise NotImplementedError, 'generate_records_attributes has to be defined!'
    end

    def column_quantity
      @column_quantity ||= @work_sheet[0].cells.count
    end

    def rows_quantity
      @work_sheet.count - 1
    end
  end
end
