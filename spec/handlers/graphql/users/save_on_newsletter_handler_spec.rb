# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Graphql::Users::SaveOnNewsletterHandler do
  subject { described_class.handle(params) }

  let(:params) do
    { input: { email: 'jan.kowalski123@gmail.com' } }
  end

  describe '#handle' do
    it 'invokes handler with successs' do
      subject
    end
  end
end
