describe DespamilatorFilter::IPAddressURL do

  it_should_behave_like "a filter"

  def filter_name
    'IP Address URL'
  end

  def filter_description
    'Detects IP address URLs'
  end

  def filter_class
    DespamilatorFilter::IPAddressURL
  end

  def single_match_string
    'http://12.34.56.78/'
  end

  def multiple_match_string
    'http://12.34.56.78/ http://98.76.54.32/'
  end

  def multiple_match_score
    0.5
  end

  def multiple_match_quantity
    1
  end

  def single_match_score
    0.5
  end

end