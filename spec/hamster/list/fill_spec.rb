require "spec_helper"
require "hamster/list"

describe Hamster::List do
  describe "#fill" do
    before do
      @original = Hamster.list(1, 2, 3, 4, 5, 6)
    end

    it "can replace a range of items at the beginning of a list" do
      @original.fill(:a, 0, 3).should eql(Hamster.list(:a, :a, :a, 4, 5, 6))
    end

    it "can replace a range of items in the middle of a list" do
      @original.fill(:a, 3, 2).should eql(Hamster.list(1, 2, 3, :a, :a, 6))
    end

    it "can replace a range of items at the end of a list" do
      @original.fill(:a, 4, 2).should eql(Hamster.list(1, 2, 3, 4, :a, :a))
    end

    it "can replace all the items in a list" do
      @original.fill(:a, 0, 6).should eql(Hamster.list(:a, :a, :a, :a, :a, :a))
    end

    it "can fill past the end of the list" do
      @original.fill(:a, 3, 6).should eql(Hamster.list(1, 2, 3, :a, :a, :a, :a, :a, :a))
    end

    it "(with 1 arg) replaces all the items in the list by default" do
      @original.fill(:a).should eql(Hamster.list(:a, :a, :a, :a, :a, :a))
    end

    it "(with 2 args) replaces up to the end of the list by default" do
      @original.fill(:a, 4).should eql(Hamster.list(1, 2, 3, 4, :a, :a))
    end

    it "(if index and length are 0) can leave a list unmodified" do
      @original.fill(:a, 0, 0).should eql(@original)
    end

    it "is lazy" do
      -> { Hamster.stream { fail }.fill(:a, 0, 1) }.should_not raise_error
    end
  end
end