class Despamilator
  class Subject
    attr_reader :score, :text

    def initialize text
      @score = 0.0
      @matches = {}
      @text = text
    end

    def register_match! details
      @score += details[:score] || raise('A score must be supplied')
      filter = details[:filter] || raise('A filter must be supplied')

      @matches[filter] ||= 0.0
      @matches[filter] += details[:score]
    end

    def matches
      @matches.map do |filter, score|
        {:filter => filter, :score => score}
      end.sort do |a, b|
        b[:score] <=> a[:score]
      end
    end

  end
end
