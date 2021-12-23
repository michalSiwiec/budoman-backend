module Types
  module Inputs
    class AuthorInputType < Types::BaseInputObject
      argument :first_name, String, required: false
      argument :last_name, String, required: false
    end
  end
end