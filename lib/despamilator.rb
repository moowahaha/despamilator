$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'despamilator/filter'

class Despamilator
  VERSION = "0.7"

  def initialize text
    @filters = Despamilator::Filter.new text
  end

  def score
    @filters.score
  end

  def matched_by
    @filters.matches
  end
end
