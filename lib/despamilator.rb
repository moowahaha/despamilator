$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'despamilator/filter'

#== SYNOPSIS:
#
#  require 'despamilator'
#
#  # some time later...
#
#  dspam = Despamilator.new('some text with an <h2> tag qthhg')
#
#  dspam.score #=> the total score for this string (1 is normally my threshold)
#  dspam.matched_by #=> array of matching filters

class Despamilator
  VERSION = "1.0"

  # Constructor. Takes the text you which to parse and score.

  def initialize text
    @filters = Despamilator::Filter.new text
  end

  # Returns the total score as a Float.

  def score
    @filters.score
  end

  # Returns an array of filters that have matched and contributed to the score.
  # Each element is a a child of the Despamilator::FilterBase class.

  def matched_by
    @filters.matches
  end
end
