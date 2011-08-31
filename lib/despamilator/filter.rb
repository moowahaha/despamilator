class Despamilator

#This class is the base class of all the despamilator filters.
#
#== EXAMPLE:
#
#This example is to detect the letter "a". Put the code in
#lib/despamilator/filter/detect_letter_a.rb:
#
#  require 'despamilator/filter_base'
#
#  module DespamilatorFilter
#
#    class DetectLetterA < Despamilator::FilterBase
#
#      def name
#        'Detecting the letter A'
#      end
#
#      def description
#        'Detects the letter "a" in a string for no reason other than a demo'
#      end
#
#      def parse text
#        if text.downcase.scan(/a/)
#        # add 0.1 to the score of the text
#        self.append_score = 0.1
#      end
#    end
#  end

  class Filter

    # The nice description of the filter. Usually no more than a sentence.

    def description
      raise "No description defined for #{self.class}"
    end

    # This method parses some text. The score is assigned to the same instance.

    def parse text
      raise "No parser defined for #{self.class}"
    end

    # The one or two word name for the filter.

    def name
      raise "No name defined for #{self.class}"
    end

  end
end