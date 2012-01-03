$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
require 'despamilator/filter'
Dir.glob(File.join(File.dirname(__FILE__), 'despamilator', 'filter', '*.rb')).each do |filter_file|
  require filter_file
end

require 'despamilator/subject'
require 'ostruct'

#== SYNOPSIS:
#
#  require 'despamilator'
#
#  # some time later...
#
#  dspam = Despamilator.new('some text with an <h2> tag qthhg')
#
#  dspam.score #=> the total score for this string (1 is normally my threshold).
#  dspam.matches #=> array of hashes containing matching filters and their score.

class Despamilator

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
    warn 'Despamilator.matched_by is deprecated, please use Despamilator.matches by 2011-12-31.'

    matches.map do |match|
      filter = match[:filter]

      OpenStruct.new(
          :name => filter.name,
          :description => filter.description,
          :score => match[:score]
      )
    end
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
