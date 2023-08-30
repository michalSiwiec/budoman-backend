describe Newsletter, type: :model do
  describe 'validations' do
    subject { described_class.new(name: 'John', surname: 'Doe', email: 'john.doe@example.com') }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:email) }

    it { should validate_uniqueness_of(:email).with_message('is already taken!') }

    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email).with_message('is invalid') }
  end
end
