class Despamilator
  class Filter
    attr_accessor :matches, :score

    def initialize text
      @@loaded ||= {}
      @filters ||= []
      @matches ||= []
      @score ||= 0
      load_filters text
      run_filters
    end

    private

    def load_filters text
      Dir.glob(File.dirname(__FILE__) + "/filter/*.rb").each do |filter_file|
        filter_name = classify_filename filter_file
        filter = @@loaded[filter_name]
        
        unless filter

          filter_code = File.open(filter_file, File::RDWR).read
          filter = Class.new
          filter.class_eval(
                  "require 'despamilator/filter_base'\nclass #{filter_name} < Despamilator::FilterBase\n#{filter_code}\nend"
          )
        end

        @filters.push(filter.const_get(filter_name).new(text, File.basename(filter_file)))
      end
    end

    def run_filters
      @filters.each do |filter|
        filter.parse

        if filter.matched?
          @matches.push(filter)
          @score += filter.score
        end
      end
    end

    def classify_filename filename
      classname = ''
      File.basename(filename).gsub(/\.rb$/, '').split('_').each do |filename_part|
        classname += filename_part.capitalize
      end
      classname || filename.capitalize
    end
  end
end