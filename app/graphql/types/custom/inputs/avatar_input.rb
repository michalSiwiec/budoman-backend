# frozen_string_literal: true

module Types
  module Custom
    module Inputs
      class AvatarInput < Types::BaseInputObject
        argument :main, Boolean, required: true
        argument :base64, String, required: true
        argument :file_name, String, required: true
      end
    end
  end
end
