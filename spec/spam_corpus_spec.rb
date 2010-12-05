describe Despamilator do

  Dir.glob(File.join(File.dirname(__FILE__), 'spam_corpus', '*.txt.gz')).each do |sample|
    it "should give #{sample} a score above 1" do
      Despamilator.new(unzip_file(sample)).score.should >= 1
    end
  end

end