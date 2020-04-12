require 'spec_helper'

describe Immutable::Set do
  [:dup, :clone].each do |method|
    let(:set) { S['A', 'B', 'C'] }

    describe "##{method}" do
      it 'returns self' do
        set.send(method).should equal(set)
      end
    end
  end
end
