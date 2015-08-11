require 'spec_helper'

describe StatsdTestHarness do

  context "configuration" do

    let(:tool_config) {
      {
        name: 'rspec',
        command: 'bundle exec rspec',
        label: 'rspec',
        options: '--format documentation',
        ignore_return_value: true
      }
    }

    before do
      StatsdTestHarness.configure do |config|
        config.tools = [tool_config]
      end
    end

    context "tools" do

      let(:tool_configuration) { StatsdTestHarness.config.tools.first }

      it "sets a tool's name" do
        expect(tool_configuration[:name]).to eq 'rspec'
      end

      it "sets a tool's command" do
        expect(tool_configuration[:command]).to eq 'bundle exec rspec'
      end

      it "sets a tool's label" do
        expect(tool_configuration[:label]).to eq 'rspec'
      end

      it "sets a tool's options" do
        expect(tool_configuration[:options]).to eq '--format documentation'
      end

      it "sets a tool's ignore_return_value flag" do
        expect(tool_configuration[:ignore_return_value]).to be_truthy
      end

    end

  end

end