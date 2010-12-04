class Despamilator
  class Filter
    attr_accessor :matches, :score

    def initialize text
      @filters ||= []
      @matches ||= []
      @score ||= 0
      run_filters text
    end

    private

    def run_filters text
      @@filter_classes.each do |filter_class|
        filter = filter_class.new
        filter.parse text.dup

        if filter.matched?
          @matches.push(filter)
          @score += filter.score
        end
      end
    end

    def self.classname_for filename
      classname = ''

      File.basename(filename).gsub(/\.rb$/, '').split('_').each do |filename_part|
        classname += filename_part.capitalize
      end

      classname
    end

    Dir.glob(File.dirname(__FILE__) + "/filter/*.rb").each do |filter_file|
      next unless filter_file =~ /(funky_consonant|naughty_q|ip_address_url|long_words|naughty_words|numbers_and_words)/

      require filter_file

      @@filter_classes ||= []
      @@filter_classes << Object.const_get('DespamilatorFilter').const_get(Despamilator::Filter.classname_for(filter_file))
    end
    
  end
end