require 'rails_helper'

RSpec.describe Aws::S3::AvatarBuilder do
  subject { described_class.new(payload: avatar, id: id) }

  let(:avatar) do
    load_json('spec/fixtures/graphql/create_user.json').dig(:avatars, 0)
  end
  let(:id) { '2c4eeef4-e060-4eb7-865d-879eae1c19e6' }

  describe '#base64' do
    let(:trimed_avatar) do
      load_json('spec/fixtures/builders/aws/s3/base64.json')[:base64]
    end

    it 'returns trimed data' do
      expect(Base64).to receive(:decode64).once.with(trimed_avatar)
      subject.base64
    end
  end

  describe '#path' do
    let(:path) { '2c4eeef4-e060-4eb7-865d-879eae1c19e6/png.jpeg' }

    it 'returns path to file on AWS' do
      expect(subject.path).to eq(path)
    end
  end

  describe '#avatar_details' do
    let(:avatar_details) do
      load_json('spec/fixtures/builders/aws/s3/avatar_details.json')[:avatar_details]
    end

    it 'returns avatars details' do
      expect(subject.avatar_details).to eq(avatar_details)
    end
  end
end
