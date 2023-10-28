describe UserValidator, type: :validator do
  subject { User.new(avatars: avatars) }

  context 'when avatars is not an array' do
    let(:avatars) { 12 }

    it do
      subject.save
      expect(subject.errors[:avatars]).to include('should be Array type!')
    end
  end

  context 'when avatar does not contain required fields' do
    let(:avatars) { [{ storage_path: '/path/to/avatar' }] }

    it do
      subject.save
      expect(subject.errors[:avatars]).to include('should contain exactly: main ,storage_path keys, contains: storage_path')
    end
  end

  context 'when avatar contains bad fields with incorrect types' do
    let(:avatars) { [{ main: 'main', storage_path: 12 }] }

    it do
      subject.save
      expect(subject.errors[:avatars]).to include('main should be boolean type, storage_path should be string type!')
    end
  end
end
