describe Newsletters::SubscribeToNewsletterService, type: :service do
  describe '#call' do
    subject { described_class.call(params: params) }

    let(:params) { attributes_for(:newsletter) }

    it 'saves user to newsletter' do
      expect { subject }.to change { Newsletter.count }.from(0).to(1)
    end
  end
end
