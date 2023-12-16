describe Invoices::UploadOnStorageService, type: :service do
	describe '#call' do
		subject { described_class.call(order: order) }

		let(:order) { create(:order) }
		let(:s3_service) { instance_double(Aws::S3Service, put_object: true) }
		let(:storage_payload_service) { instance_double(Invoices::BuildStoragePayloadService, call: { bucket: 'bucket', path: 'path', body: 'body' }) }

		before do
			allow(Aws::S3Service).to receive(:new).and_return(s3_service)
			allow(Invoices::BuildStoragePayloadService).to receive(:new).and_return(storage_payload_service)
		end

		it 'upload invoice on storage' do
			expect(s3_service).to receive(:put_object).once.with(key: 'path', body: 'body')
			subject
		end
	end
end
