module StatsdTestHarness

  class TestData

    attr_reader :raw_output

    def self.from(output)
      new(output)
    end

    def initialize(raw_output)
      @raw_output = raw_output
    end

    # FIXME parse output for duration
    def duration
      12
    end

  end

end