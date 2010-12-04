require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "FunkyConsonant" do
  it_should_behave_like "a filter"

  def filter_name
    'Funky Consonant'
  end

  def filter_description
    'Detects and scores each occurrence of a consonant next to an unlikely character'
  end

  def filter_class
    DespamilatorFilter::FunkyConsonant
  end

  def single_match_string
    'zt'
  end

  def multiple_match_string
    'ztzt'
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