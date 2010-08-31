require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "FunkyConsonant" do
  it "should return a score for 1 misplaced z" do
    dspam = Despamilator.new('zt')
    dspam.score.should == 0.05
  end

  describe 'attributes' do
    before :each do
      @filter = Despamilator.new('vtjk').matched_by.first
    end

    it "should have a filename" do
      @filter.filename.should == 'funky_consonant.rb'
    end

    it "should have a name" do
      @filter.name.should == 'Funky Consonant'
    end

    it "should have a description" do
      @filter.description.should == 'Detects and scores each occurrence of a consonant next to an unlikely character'
    end

    it "should have a number of matches" do
      @filter.matches.should == 2
    end

    it "should have a score" do
      @filter.score.should == 0.1
    end
  end

  it "should score more for 3 misplaced q's" do
    dspam = Despamilator.new('ztgb')
    dspam.score.to_s.should == 0.1.to_s
  end
end