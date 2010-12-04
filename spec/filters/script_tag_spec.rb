require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "ScriptTag" do

  it_should_behave_like "a filter"

  def filter_name
    'Script tag'
  end

  def filter_description
    'Searches for variations for the HTML script tag'
  end

  def filter_class
    DespamilatorFilter::ScriptTag
  end

  def single_match_string
    '<script>'
  end

  def single_match_score
    1
  end

  def multiple_match_string
    '<script></script> <script></script>'
  end

  def multiple_match_quantity
    1
  end
  
  def multiple_match_score
    1
  end

  describe "detecting various script tags" do
    ['<script type="whatever">', '<script></script>', '</script>', '<script>', "<script\n>"].each do |script_tag|
      [script_tag.upcase, script_tag.downcase].each do |script_tag|
        it "should detect '#{script_tag}' of a script tag" do
          dspam = Despamilator.new(script_tag)
          dspam.score.should == 1
        end
      end
    end
  end

end
