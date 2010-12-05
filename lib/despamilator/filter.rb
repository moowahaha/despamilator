class Despamilator
  class Filter
    FILTER_MODULE = 'DespamilatorFilter'
    
    attr_accessor :matches, :score

    def initialize text
      @matches ||= []
      @score ||= 0
      run_filters text
    end

    private

    def run_filters text
      Object.const_get(FILTER_MODULE).constants.each do |filter_class|
        filter = Object.const_get(FILTER_MODULE).const_get(filter_class).new
        filter.parse text.dup

        if filter.matched?
          @matches.push(filter)
          @score += filter.score
        end
      end
    end

    Dir.glob(File.join(File.dirname(__FILE__), 'filter', '*.rb')).each do |filter_file|
      require filter_file
    end
    
  end
end