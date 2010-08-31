require File.dirname(__FILE__) + '/spec_helper.rb'

describe Despamilator do

  Dir.glob(File.join(File.dirname(__FILE__), 'clean_corpus', '*.txt.gz')).each do |sample|
    it "should give #{sample} a score less than 1" do
      Despamilator.new(unzip_file(sample)).score.should < 1
    end
  end

end