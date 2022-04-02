# frozen_string_literal: true

module Types
  module Unions
    class PersonUnionType < Types::BaseUnion
      possible_types Types::Custom::Person::ManType, Types::Custom::Person::WomanType

      def self.resolve_type(object, _context)
        case object
        when Man then Types::Custom::Person::ManType
        when Woman then Types::Custom::Person::WomanType
        else raise 'unknown type'
        end
      end
    end
  end
end
