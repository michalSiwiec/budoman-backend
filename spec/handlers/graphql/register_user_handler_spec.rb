# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Graphql::RegisterUser do
  subject { described_class.handle(params) }

  let(:params) do
    load_json('spec/fixtures/graphql/create_user.json')
  end

  describe '#handle' do
    it 'creates new user' do
      expect { subject }.to change { User.count }.from(0).to(1)
    end

    it 'invokes class responsible for save avatars on AWS' do
      expect(Aws::S3::AvatarsUploader)
        .to receive(:call)
        .once
        .with(avatars: params[:avatars], id: anything)
        .and_return([])

      subject
    end

    it "updates user's avatars" do
      subject
      expect(User.last.avatars.count).to eq(2)
    end

    it 'returns created user' do
      expect(subject).to eq(User.last)
    end
  end
end
