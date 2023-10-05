describe Monitoring::HandleMonitorResourcesService, type: :service do
  describe '#call' do
    subject { described_class.call(params: {}) }

    let(:resource_builder) { instance_double(Monitoring::MonitorResourcesBuilder) }
    let(:payload_validator) { instance_double(Monitoring::ValidateAndEncodePayloadService) }
    let(:publisher) { instance_double(Monitoring::PublishOnStreamPlatformService) }

    before do
      allow(Monitoring::MonitorResourcesBuilder).to receive(:new).and_return(resource_builder)
      allow(Monitoring::ValidateAndEncodePayloadService).to receive(:new).and_return(payload_validator)
      allow(Monitoring::PublishOnStreamPlatformService).to receive(:new).and_return(publisher)
    end

    context 'success path' do
      before do
        allow(resource_builder).to receive(:build).and_return(true)
        allow(payload_validator).to receive(:call).and_return(true)
        allow(publisher).to receive(:call).and_return(true)
      end

      it { is_expected.to eq(true) }

      it 'logs success info' do
        allow(MonitoringSystemLoggerSingleton).to receive_message_chain(:instance, :info)
                                              .with('Event succesfully published on stream platform!')
      end
    end

    context 'failure path' do
      before do
        allow(resource_builder).to receive(:build).and_return(true)
        allow(payload_validator).to receive(:call).and_return(true)
        allow(publisher).to receive(:call).and_raise(StandardError, 'Something went wrong!')
      end

      it { is_expected.to eq(false) }

      it 'logs error info' do
        expect(MonitoringSystemLoggerSingleton).to receive_message_chain(:instance, :warn)
                                               .with(start_with('Event publication failed!'))
        subject
      end
    end
  end
end
