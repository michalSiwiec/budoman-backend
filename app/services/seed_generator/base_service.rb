# frozen_string_literal: true

module SeedGenerator
  class BaseService < ::BaseService
    SEED_FILE_KEY = 'seeds/Seeds.xlsx'
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
      s3_service = ::Aws::S3Service.new
      object = s3_service.get_object(key: SEED_FILE_KEY)
      buffer = object.body.read
      workbook = RubyXL::Parser.parse_buffer(buffer)
      workbook
    end

    def create_records
      generate_records_attributes.each { |attr| self.class::MODEL.find_or_create_by!(attr) }
    end

    def generate_records_attributes
      raise NotImplementedError, "#{__method__} has to be defined!"
    end

    def column_quantity
      @column_quantity ||= @work_sheet[0].cells.count
    end

    def rows_quantity
      @work_sheet.count - 1
    end
  end
end
