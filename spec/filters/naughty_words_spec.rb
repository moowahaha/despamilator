require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "NaughtyWords" do
  it "should return a score for 1 naughty word" do
    dspam = Despamilator.new('viagra')
    dspam.score.should == 0.1
  end

  describe 'attributes' do
    before :each do
      @filter = Despamilator.new('bondage').matched_by.first
    end

    it "should have a filename" do
      @filter.filename.should == 'naughty_words.rb'
    end

    it "should have a name" do
      @filter.name.should == 'Naughty Words'
    end

    it "should have a description" do
      @filter.description.should == 'Detects cheeky words'
    end

    it "should have a number of matches" do
      @filter.matches.should == 1
    end

    it "should have a score" do
      @filter.score.should == 0.1
    end
  end

  it "should score more for 3 naughty words" do
    dspam = Despamilator.new('bondage viagra penis')
    dspam.score.to_s.should == 0.3.to_s
  end
end