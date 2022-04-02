# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Aws::S3::AvatarsUploader do
  subject { described_class.call(avatars: avatars, id: user_id) }

  describe '#call' do
    let(:avatars) do
      load_json('spec/fixtures/graphql/create_user.json')[:avatars]
    end
    let(:user_id) { '2c4eeef4-e060-4eb7-865d-879eae1c19e6' }

    let(:avatar_builder) { Aws::S3::AvatarBuilder }
    let(:avatar_builder_instance) { instance_double(avatar_builder) }
    let(:aws_client) { Aws::S3::Client }
    let(:aws_client_instance) { instance_double(aws_client) }

    let(:bucket) { 'olx-development' }
    let(:path) { 'path to file' }
    let(:base64) { 'decoded data' }
    let(:avatar_details) { 'avatars details' }

    before do
      allow(avatar_builder).to receive(:new).and_return(avatar_builder_instance)
      allow(avatar_builder_instance).to receive(:bucket).and_return(bucket)
      allow(avatar_builder_instance).to receive(:path).and_return(path)
      allow(avatar_builder_instance).to receive(:base64).and_return(base64)
      allow(avatar_builder_instance).to receive(:avatar_details).and_return(avatar_details)
      allow(aws_client).to receive(:new).and_return(aws_client_instance)
      allow(aws_client_instance).to receive(:put_object).and_return('nothing')
    end

    it 'creates avatar_builder twice time' do
      expect(avatar_builder).to receive(:new).twice
      subject
    end

    it 'uploads to AWS' do
      expect(aws_client_instance)
        .to receive(:put_object)
        .twice
        .with(bucket: bucket, key: path, body: base64)

      subject
    end

    it 'returns uploaded_avatars_details' do
      expect(subject).to eq([avatar_details, avatar_details])
    end
  end
end
