require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "NaughtyWords" do

  it_should_behave_like "a filter"

  def filter_name
    'Naughty Words'
  end

  def filter_description
    'Detects cheeky words'
  end

  def filter_class
    DespamilatorFilter::NaughtyWords
  end

  def single_match_string
    'bondage'
  end

  def multiple_match_string
    'viagra penis'
  end

  def multiple_match_score
    0.2
  end

  def single_match_score
    0.1
  end

end