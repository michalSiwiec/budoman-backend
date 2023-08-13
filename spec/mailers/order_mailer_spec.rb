describe OrderMailer, type: :mailer do
  describe '#order_created' do
    subject { described_class.with(order: order).order_created.deliver_now }

    let(:order) { create(:order) }
    let(:attachment_service) { instance_double(Mails::Order::GenerateAtachmentsForOrderCreatedService, call: [{ file_name: 'Faktura.pdf', content: 'invoice_content' }]) }

    before do
      allow(Mails::Order::GenerateAtachmentsForOrderCreatedService).to receive(:new).and_return(attachment_service)
    end

    it { expect(subject.subject).to eq('Dziękujemy za zrealizowanie zamówienia!') }
    it { expect(subject.to).to eq(['john.doe123@gmail.com']) }
    it { expect(subject.from).to eq('Sklep budowlany Budoman') }

    it { expect(subject.attachments.count).to eq(1) }
    it { expect(subject.attachments.first.filename).to eq('Faktura.pdf') }
  end
end
