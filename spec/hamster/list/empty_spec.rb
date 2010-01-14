require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

require 'hamster/list'

describe Hamster::List do

  [:empty?, :null?].each do |method|

    describe "##{method}" do

      describe "on a really big list" do

        before do
          @list = Hamster.interval(0, STACK_OVERFLOW_DEPTH)
        end

        it "doesn't run out of stack" do
          pending do
            lambda { @list.filter(&:nil?).empty? }.should_not raise_error
          end
        end

      end

      [
        [[], true],
        [["A"], false],
        [["A", "B", "C"], false],
      ].each do |values, expected|

        describe "on #{values.inspect}" do

          before do
            @result = Hamster.list(*values).send(method)
          end

          it "returns #{expected.inspect}" do
            @result.should == expected
          end

        end

      end

    end

  end

end
