require 'spec_helper'

describe Immutable::List do
  [:dup, :clone].each do |method|
    [
      [],
      ['A'],
      %w[A B C],
    ].each do |values|
      context "on #{values.inspect}" do
        let(:list) { L[*values] }

        it 'returns self' do
          list.send(method).should equal(list)
        end
      end
    end
  end
end
