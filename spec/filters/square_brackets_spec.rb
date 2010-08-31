require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "SquareBrackets" do
  it "should return a score for 1 square bracket" do
    dspam = Despamilator.new('[')
    dspam.score.should == 0.05
  end

  describe 'attributes' do
    before :each do
      @filter = Despamilator.new('[]').matched_by.first
    end

    it "should have a filename" do
      @filter.filename.should == 'square_brackets.rb'
    end

    it "should have a name" do
      @filter.name.should == 'Square Brackets'
    end

    it "should have a description" do
      @filter.description.should == 'Detects each square bracket in a string'
    end

    it "should have a number of matches" do
      @filter.matches.should == 2
    end

    it "should have a score" do
      @filter.score.should == 0.1
    end
  end

end