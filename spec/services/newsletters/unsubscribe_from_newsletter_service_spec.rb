describe Newsletters::UnsubscribeFromNewsletterService, type: :service do
  describe '#call' do
    subject { described_class.call(email: newsletter.email) }

    let(:newsletter) { create(:newsletter) }

    before { newsletter }

    it 'unsubscribe user from  newsletter' do
      expect { subject }.to change { Newsletter.count }.from(1).to(0)
    end
  end
end
