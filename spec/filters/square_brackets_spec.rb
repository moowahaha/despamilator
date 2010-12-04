require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "SquareBrackets" do

  it_should_behave_like "a filter"

  def filter_name
    'Square Brackets'
  end

  def filter_description
    'Detects each square bracket in a string'
  end

  def filter_class
    DespamilatorFilter::SquareBrackets
  end

  def single_match_string
    '['
  end

  def multiple_match_string
    '[]'
  end

  def multiple_match_score
    0.1
  end

  def multiple_match_quantity
    2
  end

  def single_match_score
    0.05
  end

end