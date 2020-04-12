require "spec_helper"

describe Immutable::List do
  describe "#tails" do
    it "is lazy" do
      -> { Immutable.stream { fail }.tails }.should_not raise_error
    end

    [
      [[], []],
      [["A"], [L["A"]]],
      [%w[A B C], [L["A", "B", "C"], L["B", "C"], L["C"]]],
    ].each do |values, expected|
      context "on #{values.inspect}" do
        let(:list) { L[*values] }

        it "preserves the original" do
          list.tails
          list.should eql(L[*values])
        end

        it "returns #{expected.inspect}" do
          list.tails.should eql(L[*expected])
        end
      end
    end
  end
end
