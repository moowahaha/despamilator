require "helpers/spec_helper"

describe Despamilator do

  before do
    @dspam = Despamilator.new(Despamilator.gtubs_test_string)
  end

  it 'should return a zero score for fine text' do
    @dspam.score.should >= 100.0
  end

  it 'should return no matching filter for fine text' do
    @dspam.matches.collect { |f| f.class == DespamilatorFilter::GtubsTestFilter }.should_not be_empty
  end

  context :matched_by do
    
    before do
      expect(@dspam).to receive(:warn).with(/matched_by is deprecated/)
      @gtubs = @dspam.matched_by { |f| f.class == DespamilatorFilter::GtubsTestFilter }.collect.first
    end

    it 'should yield a name' do
      @gtubs.name.should == DespamilatorFilter::GtubsTestFilter.new.name
    end

    it 'should yield a description' do
      @gtubs.description.should == DespamilatorFilter::GtubsTestFilter.new.description
    end

    it 'should yield a score' do
      @gtubs.score.should == 100.0
    end

  end

end
