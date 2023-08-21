describe Opinions::AddOpinionService, type: :service do
  describe '#call' do
    subject { described_class.call(params: params) }

    let(:params) { { content: 'content', mark: 4, user_id: create(:user).id } }

    it 'creates new opinion' do
      expect { subject }.to change { Opinion.count }.from(0).to(1)
    end
  end
end
