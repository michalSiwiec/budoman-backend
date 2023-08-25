describe Product, type: :model do
  describe 'associations' do
    it { should belong_to(:product_category) }
    it { should have_many(:products_orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:picture_path) }

    it { should validate_numericality_of(:price) }
    it { should validate_numericality_of(:available_quantity).only_integer }
  end
end
