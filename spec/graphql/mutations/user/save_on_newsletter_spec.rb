# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::User::SaveOnNewsletter, type: :request do
  subject(:save_on_newsletter_request) do
    post '/graphql', params: { query: query, variables: variables, operationName: operationName }
  end

  let(:query) do
    <<~GQL
      mutation subscribeToNewsletter($email: String!) {
        subscribeToNewsletter(email: $email) {
          id
        }
      }
    GQL
  end

  let(:variables) { { email: 'jan.nowak123@gmail.com' } }
  let(:operationName) { 'subscribeToNewsletter' }

  let(:save_on_newsletter) { Graphql::Users::SaveOnNewsletterHandler }

  describe '.resolve' do
    it 'invokes save_on_newsletter' do
      expect(save_on_newsletter).to receive(:handle).once
      save_on_newsletter_request
    end
  end
end
