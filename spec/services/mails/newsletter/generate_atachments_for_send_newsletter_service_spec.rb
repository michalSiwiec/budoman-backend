describe Mails::Newsletter::GenerateAtachmentsForSendNewsletterService, type: :service do
  describe '#call' do
    subject { described_class.call }

    let(:file_to_string_service) { instance_double(ConvertFileToStringService, call: 'file_as_string') }

    before do
      allow(ConvertFileToStringService).to receive(:new).and_return(file_to_string_service)
    end

    it 'returns array with atachments' do
      expect(subject).to eq([{ file_name: 'Prezentacja budowlana.pptx', content: 'file_as_string' }])
    end
  end
end
