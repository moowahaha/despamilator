class Despamilator
  class FilterBase
    attr_accessor :text, :score, :filename, :matches

    def initialize text, filename
      @matches = 0
      @filename = filename
      @score = 0
      @text = text
      @matched = false
    end

    def description
      raise "No description defined in #{filename}"
    end

    def parse text
      raise "No parser defined in #{filename}"
    end

    def name
      raise "No name defined in #{filename}"
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