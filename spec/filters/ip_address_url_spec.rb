require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "IP Address URL" do
  describe 'attributes' do
    before :each do
      @filter = Despamilator.new('http://12.34.56.78/').matched_by.first
    end

    it "should have a filename" do
      @filter.filename.should == 'ip_address_url.rb'
    end

    it "should have a name" do
      @filter.name.should == 'IP Address URL'
    end

    it "should have a description" do
      @filter.description.should == 'Detects IP address URLs'
    end

    it "should have a number of matches" do
      @filter.matches.should == 1
    end

    it "should have a score" do
      @filter.score.should == 0.5
    end
  end
end