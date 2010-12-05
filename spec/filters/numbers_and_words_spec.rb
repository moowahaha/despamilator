describe DespamilatorFilter::NumbersAndWords do
  it_should_behave_like "a filter"

  def filter_name
    'Numbers next to words'
  end

  def filter_description
    'Detects unusual number/word combinations'
  end

  def filter_class
    DespamilatorFilter::NumbersAndWords
  end

  def single_match_string
    'X5T'
  end

  def multiple_match_string
    '4g6hk'
  end

  def multiple_match_score
    0.2
  end

  def multiple_match_quantity
    2
  end

  def single_match_score
    0.1
  end

  describe 'exceptions' do
    before :all do
      @filter = DespamilatorFilter::NumbersAndWords.new
    end

    [1, 4, 10, 100000, '1,000,000', '1st', '2nd', '3rd', '4th', '5th', '6th', '10th', '122nd'].each do |number|
      it "should return a blank for a #{number}" do
        @filter.parse(number.to_s)
        @filter.score.should == 0
      end
    end

    [1, 2, 3, 4, 5, 6].each do |tag_no|
      header_tag = "h#{tag_no}"

      it "should ignore html header tag #{header_tag}" do
        @filter.parse(header_tag)
        @filter.score.should == 0
      end
    end

  end

end
