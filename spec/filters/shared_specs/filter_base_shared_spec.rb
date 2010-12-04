shared_examples_for 'a filter' do

  describe 'attributes' do

    before :each do
      @filter = filter_class.new
      @filter.parse(single_match_string)
    end

    it "should have a name" do
      @filter.name.should == filter_name
    end

    it "should have a description" do
      @filter.description.should == filter_description
    end

  end

  describe 'multiple matches' do

    before :all do
      @filter = filter_class.new
      @filter.parse(multiple_match_string)
    end

    it "should have a number of matches" do
      @filter.matches.should == multiple_match_quantity
    end

    it "should have a score" do
      @filter.score.should == multiple_match_score
    end

  end

  describe "integration" do

    before do
      @filter = Despamilator.new(single_match_string)
    end

    it "should return a score for 1 match" do
      @filter.score.should == single_match_score
    end

    it "should return the name of the filter" do
      @filter.matched_by.collect { |f| f.name == filter_name }.should_not be_empty
    end

  end

end
