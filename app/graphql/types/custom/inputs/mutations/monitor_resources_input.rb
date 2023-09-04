module Types
  module Custom
    module Inputs
      module Mutations
        class MonitorResourcesInput < Types::BaseInputObject
          argument :cpu_usage, String, required: true
          argument :mem_info, String, required: true
          argument :swap_info, String, required: true
          argument :logged_users, String, required: true
          argument :recent_actions, String, required: true
          argument :private_ip, String, required: true
          argument :public_ip, String, required: true
        end
      end
    end
  end
end
