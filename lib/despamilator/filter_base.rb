class Despamilator
  class FilterBase
    attr_accessor :text, :score, :matches

    def initialize
      @matches = 0
      @score = 0
      @matched = false
    end

    def score
      # workaround for a bug in ruby 1.9.2's floats
      sprintf("%.3f", @score).to_f
    end

    def description
      raise "No description defined for #{self.class}"
    end

    def parse blah
      raise "No parser defined for #{self.class}"
    end

    def name
      raise "No name defined for #{self.class}"
    end
    
    def matched?
      @score > 0
    end

    protected

    def append_score= new_score
      @matches += 1
      @score += new_score
    end

  end
end