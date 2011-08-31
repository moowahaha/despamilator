describe Despamilator do
  before :each do
    @dspam = Despamilator.new('this text is absolutely fine')
  end

  it 'should return a zero score for fine text' do
    @dspam.score.should == 0
  end

  it 'should return no matching filter for fine text' do
    @dspam.matches.should be_empty
  end

  it 'should raise and exception when we call a dead method' do
    -> {@dspam.matched_by}.should raise_error
  end
end
