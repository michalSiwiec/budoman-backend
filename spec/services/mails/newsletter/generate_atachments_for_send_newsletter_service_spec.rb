describe Mails::Newsletter::GenerateAtachmentsForSendNewsletterService, type: :service do
  describe '#call' do
    subject { described_class.call }

    let(:s3_service) do
      string_io_instance = instance_double(StringIO, string: 'file_as_string')
      s3_object_instance = instance_double(Aws::S3::Types::GetObjectOutput, body: string_io_instance)
      instance_double(Aws::S3Service, get_object: s3_object_instance)
    end

    before do
      allow(Aws::S3Service).to receive(:new).and_return(s3_service)
    end

    it 'returns array with atachments' do
      expect(subject).to eq([{ file_name: 'Prezentacja budowlana.pptx', content: 'file_as_string' }])
    end
  end
end
