describe User, type: :model do
  describe 'validations' do
    subject { described_class.new(email: 'john.doe@example.com', password_digest: '$2a$12$YiA9qBzz8HWSXPf/WP1BkOfNFVB1zO2KY1wHbl1qD5dTdrKZzniq2') }

    it { should validate_uniqueness_of(:email).with_message('is already taken!') }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('test').for(:email) }
  end

  describe 'associations' do
    it { should have_many(:opinions).dependent(:destroy) }
    it { should have_many(:orders).dependent(:destroy) }
  end
end
