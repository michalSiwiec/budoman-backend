FactoryBot.define do
  factory :user do
		email { 'john.doe@gmail123.com' }
		password_digest { '$2a$12$e2kPNMePls1LX0k0u9Q3vO7mtOreOvrKtUXflUhXiTSEkeYjQ/s2u' }
		avatars { [] }
		name { 'John' }
		surname { 'Doe' }
		phone_number { '123456789' }
		street { 'Main street' }
		city { 'London' }
		postal_code { '34-300' }
	end
end
