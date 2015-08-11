require 'spec_helper'

describe StatsdTestHarness::Processor do

  let(:processor) { StatsdTestHarness::Processor.new("../config/sample_config.rb") }

  before do
    allow_any_instance_of(StatsdTestHarness::Processor).to receive(:load_config)
  end

  it "initializes with a config path" do
    expect(processor.path_to_config).to eq("../config/sample_config.rb")
  end

end