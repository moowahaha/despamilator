class Despamilator
  class FilterBase
    attr_accessor :text, :score, :filename, :name, :matches

    def initialize text, filename, name
      @matches = 0
      @name = name
      @filename = filename
      @score = 0
      @text = text
      @matched = false
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