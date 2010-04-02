require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Shouting" do
  describe 'attributes' do
    before :each do
      @filter = Despamilator.new('HELLO THERE!! THIS IS SHOUTING!!').matched_by.first
    end

    it "should have a filename" do
      @filter.filename.should == 'shouting.rb'
    end

    it "should have a name" do
      @filter.name.should == 'Shouting'
    end

    it "should have a description" do
      @filter.description.should == 'Detects and scores shouting (all caps)'
    end

    it "should have a number of matches" do
      @filter.matches.should == 1
    end

    it "should have a score" do
      @filter.score.should == 0.5
    end
  end

  describe "filter" do
    it "should strip out HTML" do
      Despamilator.new('<H1>this is a flipping html tag whose contents is very long</h1>').matched_by.select {|a| a.name == 'Shouting'}.should be_empty
    end

    it "should ignore strings less than 20 characters long" do
      Despamilator.new('ABCD EFG HIJKLM NOP').matched_by.select {|a| a.name == 'Shouting'}.should be_empty
    end

    it "should score based on a percentage of uppercase words" do
      [
              ['this is a lowercased string', 0],
              ['this lil string is 50 PERCENT SHOUTING', 0.25],
              ['THIS LIL STRING IS 100 PERCENT SHOUTING', 0.5]
      ].each do |string, expected_score|
        Despamilator.new(string).score.should == expected_score
      end
    end
  end
end