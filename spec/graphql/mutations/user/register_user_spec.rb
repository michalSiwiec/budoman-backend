# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::User::RegisterUser, type: :request do
  subject(:register_user_request) do
    post '/graphql', params: { query: query, variables: variables, operationName: operation_name }
  end

  let(:query) do
    <<~GQL
      mutation registerUser($input: UserInput!) {
        registerUser(input: $input) {
          id,
          email,
          password
        }
      }
    GQL
  end
  let(:variables) do
    { input: camelize_hash(create_user_json) }.to_json
  end
  let(:operation_name) { 'registerUser' }
  let(:create_user_json) { load_json('spec/fixtures/graphql/create_user.json') }
  let(:register_user_handler) { Graphql::Users::RegisterUserHandler }

  describe '.resolve' do
    it 'invokes register_user_handler once' do
      expect(register_user_handler).to receive(:handle).once
      register_user_request
    end

    it 'creates new user' do
      expect { register_user_request }.to change { User.count }.from(0).to(1)
    end

    it 'returns wanted properties' do
      register_user_request
      returned_data = json_parser(response.body).dig(:data, :registerUser)

      expect(returned_data).to have_key(:id)
      expect(returned_data[:email]).to eq(create_user_json[:email])
      expect(returned_data[:password]).to eq(create_user_json[:password])
    end
  end
end
