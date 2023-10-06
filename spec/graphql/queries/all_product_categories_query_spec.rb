describe Queries::AllProductCategoriesQuery, type: :request do
  describe 'request' do
    subject { post '/graphql', params: { query: query } }

    let(:query) do
      <<~GQL
        query {
          productsCategories {
            name
          }
        }
      GQL
    end

    before do
      create_list(:product_category, 2)
      subject
    end

    it 'returns proper http status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns list of product categories' do
      product_categories_quantity = parse_request_body.dig(:data, :productsCategories).count

      expect(product_categories_quantity).to eq(2)
    end
  end
end
