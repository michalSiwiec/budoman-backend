describe Opinion, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_inclusion_of(:mark).in_range(1..5) }
  end
end
