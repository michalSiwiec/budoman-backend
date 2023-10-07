describe Queries::IsUserLoggedQuery, type: :request do
  describe 'request' do
    subject { post '/graphql', params: { query: query } }

    let(:query) do
      <<~GQL
        query {
          isUserLogged {
            userId
          }
        }
      GQL
    end

    before { subject }

    it 'returns proper http status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns proper response' do
      expected_response = { data: { isUserLogged: { userId: nil } } }

      expect(parse_request_body).to eq(expected_response)
    end
  end
end
