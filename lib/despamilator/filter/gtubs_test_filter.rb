require 'despamilator/filter_base'

module DespamilatorFilter

  class GtubsTestFilter < Despamilator::FilterBase

    def name
      'GTubs Test Filter'
    end

    def description
      'Detects the special test string (Despamilator.gtubs_test_string) and assigns a big score.'
    end

    def parse text
      self.append_score = 100 if text == Despamilator.gtubs_test_string
    end

  end

end