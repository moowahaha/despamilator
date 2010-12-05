describe DespamilatorFilter::URLs do

  it_should_behave_like "a filter"

  def filter_name
    'URLs'
  end

  def filter_description
    'Detects each url in a string'
  end

  def filter_class
    DespamilatorFilter::URLs
  end

  def single_match_string
    'http://www.blah.com'
  end

  def multiple_match_string
    'http://www.blah.com http://www.poop.com'
  end

  def multiple_match_score
    0.4
  end

  def multiple_match_quantity
    2
  end

  def single_match_score
    0.2
  end

end