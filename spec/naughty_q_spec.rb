require File.dirname(__FILE__) + '/spec_helper.rb'

describe "NaughtyQ" do
  it "should return a score for 1 misplaced q" do
    dspam = Despamilator.new('qtu')
    dspam.score.should == 0.2
  end

  it "should return the matching filter" do
    dspam = Despamilator.new('qtu')
    dspam.matched_by.first.name.should == 'NaughtyQ'
    dspam.matched_by.first.matches.should == 1
    dspam.matched_by.first.score.should == 0.2
  end

  it "should score more for 3 misplaced q's" do
    dspam = Despamilator.new('qtuqsq')
    dspam.score.to_s.should == 0.6.to_s
  end
end
