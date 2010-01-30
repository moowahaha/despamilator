require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "NaughtyQ" do
  it "should return a score for 1 misplaced q" do
    dspam = Despamilator.new('qtu')
    dspam.score.should == 0.2
  end

  describe 'attributes' do
    before :each do
      @filter = Despamilator.new('qtqt').matched_by.first
    end

    it "should have a filename" do
      @filter.filename.should == 'naughty_q.rb'
    end

    it "should have a name" do
      @filter.name.should == 'Naughty Q'
    end

    it "should have a description" do
      @filter.description.should == 'Detects possible misuse of the letter Q (English language)'
    end

    it "should have a number of matches" do
      @filter.matches.should == 2
    end

    it "should have a score" do
      @filter.score.should == 0.4
    end
  end

  it "should score more for 3 misplaced q's" do
    dspam = Despamilator.new('qtuqsq')
    dspam.score.to_s.should == 0.4.to_s
  end
end
