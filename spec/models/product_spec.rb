describe Product, type: :model do
  describe 'scopes' do
    describe '.promoted' do
      subject { described_class.promoted }

      before do
        create(:product)
        create(:product, promoted_from: Time.now + 2.days, promoted_to: Time.now + 3.days)
        create(:product, promoted_from: Time.now - 2.days, promoted_to: Time.now - 1.days)
        create_list(:product, 2, :promoted)
      end

      it 'returns only products from proper range' do
        expect(subject.count).to eq(2)
      end
    end

    describe '.from_type' do
      subject { described_class.from_type('stairway') }

      before do
        create(:product, product_category: create(:product_category, name: 'tools'))
        create(:product, product_category: create(:product_category, name: 'foundation_zone'))
        create_list(:product, 5, product_category: create(:product_category, name: 'stairway'))
      end

      it 'returns only products from proper range' do
        expect(subject.count).to eq(5)
      end
    end
  end

  describe 'associations' do
    it { should belong_to(:product_category) }
    it { should have_many(:products_orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:picture_key) }
    it { should validate_presence_of(:picture_bucket) }

    it { should validate_numericality_of(:price) }
    it { should validate_numericality_of(:available_quantity).only_integer }
  end
end
