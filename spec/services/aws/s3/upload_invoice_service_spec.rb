describe Aws::S3::UploadInvoiceService, type: :service do
	describe '#call' do
		subject { described_class.call(order: order) }

		let(:order) { create(:order) }

		let(:s3_client) do
			instance_double(Aws::S3::Client, put_object: true)
		end

		let(:invoice_builder) do
			instance_double(Aws::S3::InvoiceBuilder, build: { bucket: 'bucket', path: 'path', body: 'body' })
		end

		before do
			allow(Aws::S3::Client).to receive(:new).and_return(s3_client)
			allow(Aws::S3::InvoiceBuilder).to receive(:new).and_return(invoice_builder)
		end

		it 'upload invoice on storage' do
			expect(s3_client).to receive(:put_object).once.with(bucket: 'bucket', key: 'path', body: 'body')
			subject
		end
	end
end
