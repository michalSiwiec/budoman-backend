describe Aws::S3::AvatarsUploaderService, type: :service do
  describe '#call' do
    subject { described_class.call(user_id: user_id, avatars: avatars) }

    let(:user_id) { create(:user).id }
    let(:avatars) { [instance_double('Avatar'), instance_double('Avatar')] }

    let(:s3_client) { instance_double(Aws::S3::Client) }
    let(:avatar_builder) { instance_double(Aws::S3::AvatarBuilder) }

    before do
      allow(Aws::S3::Client).to receive(:new).and_return(s3_client)
      allow(Aws::S3::AvatarBuilder).to receive(:new).and_return(avatar_builder)

      allow(avatar_builder).to receive(:build)
                           .and_return({ base64: 'base64_1', bucket: 'bucket_1', path: 'path_1', details: 'details_1' },
                                       { base64: 'base64_2', bucket: 'bucket_2', path: 'path_2', details: 'details_2' })

      allow(s3_client).to receive(:put_object).and_return(true)
    end

    it 'upload two avatars on storage' do
      expect(s3_client).to receive(:put_object).with(body: 'base64_1', bucket: 'bucket_1', key: 'path_1')
      expect(s3_client).to receive(:put_object).with(body: 'base64_2', bucket: 'bucket_2', key: 'path_2')
      subject
    end

    it 'returns avatars details' do
      expect(subject).to eq(%w[details_1 details_2])
    end
  end
end
