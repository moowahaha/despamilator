class Despamilator
  class Filter
    attr_accessor :matches, :score

    def initialize text
      @matches ||= []
      @score ||= 0
      run_filters text
    end

    private

    def run_filters text
      filter_namespace = Object.const_get('DespamilatorFilter')

      filter_namespace.constants.each do |filter_class|
        execute_filter(filter_namespace.const_get(filter_class).new, text)
      end
    end

    private

    def execute_filter filter, text
      filter.parse text.dup

      if filter.matched?
        @matches.push(filter)
        @score += filter.score
      end
    end

    Dir.glob(File.join(File.dirname(__FILE__), 'filter', '*.rb')).each do |filter_file|
      require filter_file
    end

  end
end