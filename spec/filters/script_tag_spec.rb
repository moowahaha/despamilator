require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "ScriptTag" do
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

  describe 'attributes' do
    before :all do
      @dspam = Despamilator.new('<script>').matched_by.first
    end

    it "should have a name" do
      @dspam.name.should == 'Detects script tags in text'
    end

    it "should have a description" do
      @dspam.description.should == 'Searches for variations for the HTML script tag'
    end

    it "should have a filename" do
      @dspam.filename.should == 'script_tag.rb'
    end
  end
end