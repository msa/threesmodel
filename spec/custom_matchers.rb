module CustomMatchers
  class BeOneOf
    def initialize(expected)
      @expected = expected
    end

    def matches?(target)
      @target = target
      if(@target.respond_to? :keys) then
        @expected.include?(@target.keys[0])
      else
        @expected.include?(@target)
      end
    end

    def failure_message
      "expected #{@target} to be one of the elements of #{@expected}"
    end

    def negative_failure_message
      "expected #{@target} not to be one of the elements of #{@expected}"
    end
  end
  def be_one_of(expected)
    BeOneOf.new(expected)
  end
end
