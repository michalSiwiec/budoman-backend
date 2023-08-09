FactoryBot.define do
	factory :order do
		name { 'John' }
		surname { 'Doe' }
		phone_number { '123456789' }
		street { 'Main street' }
		city { 'London' }
		postal_code { '34-300' }
		delivery_method { Order::DELIVERIES_DETAILS[0][:method] }
		payment_method { Order::ALLOWED_PAYMENT_METHOD[0] }
		email { 'john.doe123@gmail.com' }

		user 
	end
end
