describe Mails::Order::GenerateAtachmentsForOrderCreatedService, type: :service do
  subject { described_class.call(order: order) }

  let(:order) { create(:order) }

  let(:s3_service) do
    string_io_instance = instance_double(StringIO, string: 'file_as_string')
    s3_object_instance = instance_double(Aws::S3::Types::GetObjectOutput, body: string_io_instance)
    instance_double(Aws::S3Service, get_object: s3_object_instance)
  end

  before do
    allow(Aws::S3Service).to receive(:new).and_return(s3_service)
  end

  it 'returns array with atachments' do
    expect(subject).to eq([{ file_name: 'Faktura.pdf', content: 'file_as_string' }])
  end
end
