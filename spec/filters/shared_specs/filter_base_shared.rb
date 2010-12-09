def the_name_should_be expected_name
  it "should have a name" do
    described_class.new.name.should == expected_name
  end
end

def the_description_should_be expected_description
  it "should have a description" do
    described_class.new.description.should == expected_description
  end
end

def a_single_match_of string, expectation
  describe 'detecting a single match' do

    before :all do
      @filter = described_class.new
      @filter.parse(string)
    end

    it "should only match once" do
      @filter.matches.should == 1
    end

    it "should have a score" do
      @filter.score.should == expectation[:should_score]
    end

  end
end

def a_multiple_match_of string, expectation
  describe 'detecting a multiple matches' do

    before :all do
      @filter = described_class.new
      @filter.parse(string)
    end

    it "should match many times" do
      @filter.matches.should == expectation[:should_score].last.count
    end

    it "should have a score" do
      @filter.score.should == expectation[:should_score].first
    end

  end
end

def despamilator_should_apply_the_filter_for string

    it "should be applied during filtering" do
      filter_name = described_class.new.name
      despamilator = Despamilator.new(string)
      despamilator.matched_by.collect { |f| f.name == filter_name }.should_not be_empty
    end

end