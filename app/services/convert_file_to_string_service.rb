require 'open-uri'

class ConvertFileToStringService < BaseService
  def initialize(path_to_file:)
    super()
    @path_to_file = path_to_file
  end

  def call
    open(@path_to_file).read
  end
end
