describe Users::UploadAvatarsService, type: :service do
  describe '#call' do
    subject { described_class.call(user_id: user_id, avatars: avatars) }

    let(:user_id) { create(:user).id }
    let(:avatars) { [instance_double('Avatar'), instance_double('Avatar')] }

    let(:s3_service) { instance_double(Services::Aws::S3Service, put_object: true) }
    let(:build_avatar_payload) { instance_double(Users::BuildAvatarPayloadService) }

    before do
      allow(Services::Aws::S3Service).to receive(:new).and_return(s3_service)
      allow(Users::BuildAvatarPayloadService).to receive(:new).and_return(build_avatar_payload)

      allow(build_avatar_payload).to receive(:call)
                                 .and_return({ base64: 'base64_1', bucket: 'bucket_1', path: 'path_1', details: 'details_1' },
                                             { base64: 'base64_2', bucket: 'bucket_2', path: 'path_2', details: 'details_2' })
    end

    it 'upload two avatars on storage' do
      expect(s3_service).to receive(:put_object).with(body: 'base64_1', key: 'path_1')
      expect(s3_service).to receive(:put_object).with(body: 'base64_2', key: 'path_2')
      subject
    end

    it 'returns avatars details' do
      expect(subject).to eq(%w[details_1 details_2])
    end
  end
end
