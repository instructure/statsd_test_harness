require 'spec_helper'

describe StatsdTestHarness::Processor do

  let(:processor) { StatsdTestHarness::Processor.new("path/to/config.rb") }

  it "initializes with a config path" do
    expect(processor.path_to_config).to eq("path/to/config.rb")
  end

end