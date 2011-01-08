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

  # Generic Test for Unsolicited Bulk Submissions. Similar to SpamAssassin's GTUBE.
  # A string that will result in a spam score of at least 100. Handy for testing.

  def self.gtubs_test_string
    '89913b8a065b7092721fe995877e097681683af9d3ab767146d5d6fd050fc0bda7ab99f4232d94a1'
  end
end
