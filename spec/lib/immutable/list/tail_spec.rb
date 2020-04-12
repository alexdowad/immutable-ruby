require "spec_helper"

describe Immutable::List do
  describe "#tail" do
    context "on a really big list" do
      it "doesn't run out of stack" do
        -> { BigList.select(&:nil?).tail }.should_not raise_error
      end
    end

    [
      [[], []],
      [["A"], []],
      [%w[A B C], %w[B C]],
    ].each do |values, expected|
      context "on #{values.inspect}" do
        let(:list) { L[*values] }

        it "preserves the original" do
          list.tail
          list.should eql(L[*values])
        end

        it "returns #{expected.inspect}" do
          list.tail.should eql(L[*expected])
        end
      end
    end
  end
end
