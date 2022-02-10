module Types
  module Inputs
    class AvatarInputType < Types::BaseInputObject
      argument :main, Boolean
      argument :storage_path, String
    end
  end
end
