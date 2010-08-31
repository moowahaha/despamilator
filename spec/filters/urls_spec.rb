require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Url" do
  it "should return a score for 1 url" do
    dspam = Despamilator.new('http://www.blah.com')
    dspam.score.should == 0.15
  end

  describe 'attributes' do
    before :each do
      @filter = Despamilator.new('http://www.blah.com').matched_by.first
    end

    it "should have a filename" do
      @filter.filename.should == 'urls.rb'
    end

    it "should have a name" do
      @filter.name.should == 'URLs'
    end

    it "should have a description" do
      @filter.description.should == 'Detects each url in a string'
    end

    it "should have a number of matches" do
      @filter.matches.should == 1
    end

    it "should have a score" do
      @filter.score.should == 0.15
    end
  end

  it "should score more for 2 misplaced urls" do
    dspam = Despamilator.new('http://www.blah.com http://www.poop.com')
    dspam.score.to_s.should == 0.3.to_s
  end
end