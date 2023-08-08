describe User, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:email).with_message('is already taken!') }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('test').for(:email) }
  end

  describe 'associations' do
    it { should have_many(:opinions).dependent(:destroy) }
    it { should have_many(:orders).dependent(:destroy) }
  end
end
