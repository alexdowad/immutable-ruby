require 'spec_helper'

describe Immutable::List do
  describe '#to_set' do
    [
      [],
      ['A'],
      %w[A B C],
    ].each do |values|
      context "on #{values.inspect}" do
        it 'returns a set with the same values' do
          L[*values].to_set.should eql(S[*values])
        end
      end
    end
  end
end
