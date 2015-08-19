require 'spec_helper'

describe StatsdTestHarness::Tool do

  describe "run" do
    let(:tool) {
      StatsdTestHarness::Tool.new(
        :name    => "simulated_failure",
        :command => "echo 1",
        :options => "",
        :label   => "simulated_failure",
        :ignore_return_value => false
      )
    }

    it "returns exit status" do
      allow(tool).to receive(:exit_status).and_return(1)
      expect(tool.run).to eq(1)
    end

  end


  describe "initialization" do

    let(:tool) {
      StatsdTestHarness::Tool.new(
        :name    => "rspec",
        :command => "bundle exec rspec",
        :options => "--format documentation",
        :label   => "rspec_test",
        :ignore_return_value => true
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

  end

end
