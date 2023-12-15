describe Services::Monitoring::HandleMonitorResourcesService, type: :service do
  describe '#call' do
    subject { described_class.call(params: {}) }

    let(:resource_builder) { instance_double(Services::Monitoring::BuildMonitoringPayloadService) }
    let(:payload_validator) { instance_double(Services::StreamPlatform::ValidateAndEncodePayloadService) }
    let(:publisher) { instance_double(Services::StreamPlatform::PublishService) }
    let(:logger) { instance_double(Services::LoggerService) }

    before do
      allow(Services::Monitoring::BuildMonitoringPayloadService).to receive(:new).and_return(resource_builder)
      allow(Services::StreamPlatform::ValidateAndEncodePayloadService).to receive(:new).and_return(payload_validator)
      allow(Services::StreamPlatform::PublishService).to receive(:new).and_return(publisher)
      allow(Services::LoggerService).to receive(:new).and_return(logger)
    end

    context 'success path' do
      before do
        allow(resource_builder).to receive(:call).and_return(true)
        allow(payload_validator).to receive(:call).and_return(true)
        allow(publisher).to receive(:call).and_return(true)
        allow(logger).to receive(:info).and_return(true)
      end

      it { is_expected.to eq(true) }

      it 'logs success info' do
        expect(logger).to receive(:info).with(message: 'Event succesfully published on stream platform!')
        subject
      end
    end

    context 'failure path' do
      before do
        allow(resource_builder).to receive(:call).and_return(true)
        allow(payload_validator).to receive(:call).and_return(true)
        allow(publisher).to receive(:call).and_raise(StandardError, 'Something went wrong!')
        allow(logger).to receive(:warn).and_return(true)
      end

      it { is_expected.to eq(false) }

      it 'logs error info' do
        expect(logger).to receive(:warn).with(message: /Event publication failed!/)
        subject
      end
    end
  end
end
