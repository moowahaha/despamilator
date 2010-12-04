require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Shouting" do

  it_should_behave_like "a filter"

  def filter_name
    'Shouting'
  end

  def filter_description
    'Detects and scores shouting (all caps)'
  end

  def filter_class
    DespamilatorFilter::Shouting
  end

  def single_match_string
    'this lil string is 50 PERCENT SHOUTING'
  end

  def multiple_match_string
    'HELLO THERE!! THIS IS SHOUTING!!'
  end

  def multiple_match_score
    0.5
  end

  def multiple_match_quantity
    1
  end

  def single_match_score
    0.25
  end

  describe "exceptions" do

    before :all do
      @filter = DespamilatorFilter::Shouting.new
    end

    it "should strip out HTML" do
      @filter.parse('<H1>this is a flipping html tag whose contents is very long</h1>')
      @filter.score.should == 0
    end

    it "should ignore strings less than 20 characters long" do
      @filter.parse('ABCD EFG HIJKLM NOP')
      @filter.score.should == 0
    end

  end

  [
          ['this is a lowercased string', 0],
          ['this lil string is 50 PERCENT SHOUTING', 0.25],
          ['THIS LIL STRING IS 100 PERCENT SHOUTING', 0.5]
  ].each do |string, expected_score|

    it "should score the string '#{string}' based on a percentage of uppercase words" do
      filter = DespamilatorFilter::Shouting.new

      filter.parse(string)
      filter.score.should == expected_score
    end

  end

end