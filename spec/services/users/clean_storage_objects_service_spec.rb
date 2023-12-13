describe Users::CleanStorageObjectsService, type: :service do
	describe '#call' do
		subject { described_class.call(user: user) }

		let(:user) { create(:user) }
		let(:s3_service) { instance_double(Aws::S3Service, delete_object: true) }

		before do
			allow(Aws::S3Service).to receive(:new).and_return(s3_service)
			allow(s3_service).to receive_message_chain(:list_objects, :contents)
											 .and_return([instance_double('S3 object', key: 'key1'),
																	  instance_double('S3 object', key: 'key2'),
																	  instance_double('S3 object', key: 'key3')])
		end

		it "removes each user's object" do
			expect(s3_service).to receive(:delete_object).thrice
			subject
		end
	end
end
