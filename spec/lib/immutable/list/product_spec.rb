require "spec_helper"

describe Immutable::List do
  describe "#product" do
    context "on a really big list" do
      it "doesn't run out of stack" do
        -> { BigList.product }.should_not raise_error
      end
    end

    [
      [[], 1],
      [[2], 2],
      [[1, 3, 5, 7, 11], 1155],
    ].each do |values, expected|
      context "on #{values.inspect}" do
        it "returns #{expected.inspect}" do
          L[*values].product.should == expected
        end
      end
    end
  end
end
