describe Despamilator do
  before :each do
    @dspam = Despamilator.new('this text is absolutely fine')
  end

  it "should return a zero score for fine text" do
    @dspam.score.should == 0
  end

  it "should return no matching filter for fine text" do
    @dspam.matches.should be_empty
  end
end
