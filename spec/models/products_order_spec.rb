describe ProductsOrder, type: :model do
  describe 'associations' do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:product_quantity).only_integer }
  end
end
