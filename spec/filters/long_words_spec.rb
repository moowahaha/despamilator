require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "LongWords" do
  it "should return a score for 1 long word" do
    dspam = Despamilator.new('honorificabilitudinitatibus')
    dspam.score.should == 0.1
  end

  describe 'attributes' do
    before :each do
      @filter = Despamilator.new('honorificabilitudinitatibus antidisestablishmentarianism').matched_by.first
    end

    it "should have a filename" do
      @filter.filename.should == 'long_words.rb'
    end

    it "should have a name" do
      @filter.name.should == 'Long Words'
    end

    it "should have a description" do
      @filter.description.should == 'Detects long and unbroken strings'
    end

    it "should have a number of matches" do
      @filter.matches.should == 2
    end

    it "should have a score" do
      @filter.score.to_s.should == 0.2.to_s
    end
  end
end
