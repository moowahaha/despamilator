require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "NaughtyQ" do

  it_should_behave_like "a filter"

  def filter_name
    'Naughty Q'
  end

  def filter_description
    'Detects possible misuse of the letter Q (English language)'
  end

  def filter_klass
    DespamilatorFilter::NaughtyQ
  end

  def single_match_string
    'qtu'
  end

  def multiple_match_string
    'qtq'
  end

  def multiple_match_score
    0.4
  end

  def single_match_score
    0.2
  end

end
