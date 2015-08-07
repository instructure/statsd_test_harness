require 'spec_helper'

describe StatsdTestHarness::Tool do

  describe "initialization" do

    let(:tool) {
      StatsdTestHarness::Tool.new(
        :name    => "rspec",
        :command => "bundle exec rspec",
        :options => "--format documentation",
        :label   => "rspec_test",
        :ignore_return_value => true,
        :postprocessor => StatsdTestHarness::Postprocessors::RSpec
      )
    }

    it "sets its name" do
      expect(tool.name).to eq("rspec")
    end

    it "sets its command" do
      expect(tool.command).to eq("bundle exec rspec")
    end

    it "sets its options" do
      expect(tool.options).to eq("--format documentation")
    end

    it "sets its label" do
      expect(tool.label).to eq("rspec_test")
    end

    it "sets its ignore_return_value flag" do
      expect(tool.ignore_return_value).to be_truthy
    end

    it "sets its postprocessor" do
      expect(tool.postprocessor).to eq(StatsdTestHarness::Postprocessors::RSpec)
    end

  end

end