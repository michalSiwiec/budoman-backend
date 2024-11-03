# frozen_string_literal: true

module Types
  module Custom
    module Objects
      module Users
        class UserObject < Types::BaseObject
          field :id, ID, null: false
          field :email, String, null: false
          field :password, String, null: false
          field :avatars, [Types::Custom::Objects::Users::AvatarObject], null: false
          field :name, String, null: true
          field :surname, String, null: true
          field :phone_number, String, null: true
          field :street, String, null: true
          field :city, String, null: true
          field :postal_code, String, null: true
          field :saved_to_newsletter, Boolean, null: false
  
          def saved_to_newsletter
            Newsletter.find_by(email: object.email).present?
          end
        end
      end
    end
  end
end
