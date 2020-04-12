require "spec_helper"

describe Immutable::Vector do
  describe "#clear" do
    [
      [],
      ["A"],
      %w[A B C],
    ].each do |values|
      describe "on #{values}" do
        let(:vector) { V[*values] }

        it "preserves the original" do
          vector.clear
          vector.should eql(V[*values])
        end

        it "returns an empty vector" do
          vector.clear.should equal(V.empty)
        end
      end

      context "from a subclass" do
        it "returns an instance of the subclass" do
          subclass = Class.new(Immutable::Vector)
          instance = subclass.new(%w{a b c})
          instance.clear.class.should be(subclass)
          instance.clear.should be_empty
        end
      end
    end
  end
end
