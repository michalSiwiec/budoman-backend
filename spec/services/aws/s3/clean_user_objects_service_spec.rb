describe Aws::S3::CleanUserObjectsService, type: :service do
	describe '#call' do
		subject { described_class.call(user: user) }

		let(:user) { create(:user) }
		let(:s3_client) { instance_double(Aws::S3::Client) }

		before do
			allow(Aws::S3::Client).to receive(:new).and_return(s3_client)
			allow(s3_client).to receive_message_chain(:list_objects, :contents)
											.and_return([instance_double('S3 object', key: 'key1'),
																	 instance_double('S3 object', key: 'key2'),
																	 instance_double('S3 object', key: 'key3')])

			allow(s3_client).to receive(:delete_object).and_return(true)
		end

		it "removes each user's object" do
			expect(s3_client).to receive(:delete_object).thrice
			subject
		end
	end
end
