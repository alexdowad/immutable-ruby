require 'spec_helper'

describe Immutable::Deque do
  [:dequeue, :shift].each do |method|
    describe "##{method}" do
      [
        [[], []],
        [['A'], []],
        [%w[A B C], %w[B C]],
      ].each do |values, expected|
        context "on #{values.inspect}" do
          let(:deque) { D[*values] }

          it 'preserves the original' do
            deque.send(method)
            deque.should eql(D[*values])
          end

          it "returns #{expected.inspect}" do
            deque.send(method).should eql(D[*expected])
          end
        end
      end
    end

    context 'on empty subclass' do
      let(:subclass) { Class.new(Immutable::Deque) }
      let(:empty_instance) { subclass.new }
      it 'returns empty object of same class' do
        empty_instance.send(method).class.should be subclass
      end
    end
  end
end
