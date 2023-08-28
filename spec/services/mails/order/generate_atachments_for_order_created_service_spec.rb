describe Mails::Order::GenerateAtachmentsForOrderCreatedService, type: :service do
  subject { described_class.call(order: order) }

  let(:order) { create(:order) }
  let(:file_to_string_service) { instance_double(ConvertFileToStringService, call: 'file_as_string') }

  before do
    allow(ConvertFileToStringService).to receive(:new).and_return(file_to_string_service)
  end

  it 'returns array with atachments' do
    expect(subject).to eq([{ file_name: 'Faktura.pdf', content: 'file_as_string' }])
  end
end
