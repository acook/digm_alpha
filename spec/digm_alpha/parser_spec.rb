require 'spec_helper'
require 'digm_alpha/parser'

describe DigmAlpha::Parser do
  it 'should exist' do
    subject.should be
  end

  describe '.parse' do
    let(:test_string) { '(this "is" a test( 1 2.0 3))' }
    subject(:tree) { DigmAlpha::Parser.parse test_string }

    it 'should load the data stream into nodes' do
      tree.should be
    end
  end
end
