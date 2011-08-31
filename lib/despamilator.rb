$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

Dir.glob(File.join(File.dirname(__FILE__), 'despamilator', 'filter', '*.rb')).each do |filter_file|
  require filter_file
end

require 'despamilator/subject'

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
  VERSION = "2.0.1"

  # Constructor. Takes the text you which to parse and score.

  def initialize text
    @subject = Despamilator::Subject.new text
    run_filters @subject
  end

  # Returns the total score as a Float.

  def score
    @subject.score
  end

  def matched_by
    raise "This method is dead. Please use 'matches'. The return value is a bit different too..."
  end

  # Returns an array of scores and filters that have matched and contributed to the score.
  # Each element is a a child of the Despamilator::FilterBase class.

  def matches
    @subject.matches
  end

  # Generic Test for Unsolicited Bulk Submissions. Similar to SpamAssassin's GTUBE.
  # A string that will result in a spam score of at least 100. Handy for testing.

  def self.gtubs_test_string
    '89913b8a065b7092721fe995877e097681683af9d3ab767146d5d6fd050fc0bda7ab99f4232d94a1'
  end

  private

  def run_filters subject
    filter_namespace = Object.const_get('DespamilatorFilter')

    filter_namespace.constants.each do |filter_class|
      filter = filter_namespace.const_get(filter_class).new
      filter.parse(subject)
    end
  end

end
