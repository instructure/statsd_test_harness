require 'spec_helper'

describe StatsdTestHarness::Client do

  describe "post" do
    it "sends success timing to client" do
      statsd_client = double("statsd_client")
      subject = StatsdTestHarness::Client.new
      allow(subject).to receive(:client).and_return(statsd_client)
      allow(subject).to receive(:bucket).and_return("bucket")
      expect(statsd_client).to receive(:timing).with("bucket.tool_label.success", 13)
      subject.post(13, "tool_label", true)
    end

    it "sends fail timing to client" do
      statsd_client = double("statsd_client")
      subject = StatsdTestHarness::Client.new
      allow(subject).to receive(:client).and_return(statsd_client)
      allow(subject).to receive(:bucket).and_return("bucket")
      expect(statsd_client).to receive(:timing).with("bucket.tool_label.fail", 13)
      subject.post(13, "tool_label", false)
    end

    it "does not send failures when send_failures is false" do
      statsd_client = double("statsd_client")
      subject = StatsdTestHarness::Client.new
      allow(subject).to receive(:client).and_return(statsd_client)
      allow(subject).to receive(:bucket).and_return("bucket")
      expect(statsd_client).to_not receive(:timing)
      subject.post(13, "tool_label", false, false)
    end
  end

  describe "bucket" do
    it 'concatenates namespace and app_name' do
      config = double()
      allow(config).to receive(:namespace).and_return('namespace')
      allow(config).to receive(:app_name).and_return('app_name')
      allow(StatsdTestHarness).to receive(:config).and_return(config)
      subject = StatsdTestHarness::Client.new
      expect(subject.send :bucket).to eq('namespace.app_name')
    end
  end

end
