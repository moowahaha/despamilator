require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "NumbersAndWords" do
  [1, 4, 10, 100000, '1,000,000', '1st', '2nd', '3rd', '4th', '5th', '6th', '10th', '122nd'].each do |number|
    it "should return a blank for a #{number}" do
      dspam = Despamilator.new(number)
      dspam.score.should == 0
    end
  end

  ['wanga x5 mool', '4ghk', 'XTHL9'].each do |string|
    it "should detect suspicious number word combos such as #{string}" do
      dspam = Despamilator.new(string)
      dspam.score.should == 0.1
    end
  end

  ['4wanga x5 mool', '4g6hk', 'XT7HL9', '77th8nd'].each do |string|
    it "should detect multiple suspicious number word combos such as #{string}" do
      dspam = Despamilator.new(string)
      dspam.score.should == 0.2
    end
  end

  [1, 2, 3, 4, 5, 6].each do |tag_no|
    header_tag = "h#{tag_no}"

    it "should ignore html header tag #{header_tag}" do
      dspam = Despamilator.new(header_tag)
      dspam.score.should == 0
    end
  end

  describe 'attributes' do
    before :each do
      @filter = Despamilator.new('X5T').matched_by.first
    end

    it "should have a filename" do
      @filter.filename.should == 'numbers_and_words.rb'
    end

    it "should have a name" do
      @filter.name.should == 'Numbers next to words'
    end

    it "should have a description" do
      @filter.description.should == 'Detects unusual number/word combinations'
    end

    it "should have a number of matches" do
      @filter.matches.should == 1
    end

    it "should have a score" do
      @filter.score.should == 0.1
    end
  end
end
