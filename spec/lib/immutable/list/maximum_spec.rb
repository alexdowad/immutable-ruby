require "spec_helper"

describe Immutable::List do
  describe "#max" do
    context "on a really big list" do
      it "doesn't run out of stack" do
        -> { BigList.max }.should_not raise_error
      end
    end

    context "with a block" do
      [
        [[], nil],
        [["A"], "A"],
        [%w[Ichi Ni San], "Ichi"],
      ].each do |values, expected|
        context "on #{values.inspect}" do
          it "returns #{expected.inspect}" do
            L[*values].max { |maximum, item| maximum.length <=> item.length }.should == expected
          end
        end
      end
    end

    context "without a block" do
      [
        [[], nil],
        [["A"], "A"],
        [%w[Ichi Ni San], "San"],
      ].each do |values, expected|
        context "on #{values.inspect}" do
          it "returns #{expected.inspect}" do
            L[*values].max.should == expected
          end
        end
      end
    end
  end
end
