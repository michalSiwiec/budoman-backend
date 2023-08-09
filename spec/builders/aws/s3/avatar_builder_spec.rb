describe Aws::S3::AvatarBuilder, type: :builder do
  describe  '#build' do
    subject { described_class.build(user_id: user.id, avatar: avatar) }

    let(:user) { create(:user, id: '18c9bb53-3d92-4e8d-944c-660ddb5a2228') }
    let(:avatar) { { base64: 'abcd,efgh', file_name: 'file_name', main: true } }

    it { expect(subject[:base64].force_encoding('ASCII-8BIT')).to eq("y\xF8!".force_encoding('ASCII-8BIT')) }
    it { expect(subject[:path]).to eq('users/18c9bb53-3d92-4e8d-944c-660ddb5a2228/avatars/file_name') }
    it { expect(subject[:bucket]).to eq('olx-development') }
    it { expect(subject[:details]).to eq({ main: true, storage_path: 'https://olx-development.s3.eu-central-1.amazonaws.com/users/18c9bb53-3d92-4e8d-944c-660ddb5a2228/avatars/file_name' }) }
  end
end
