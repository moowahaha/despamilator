require 'despamilator/filter'

module DespamilatorFilter

  class GtubsTestFilter < Despamilator::Filter

    def name
      'GTubs Test Filter'
    end

    def description
      'Detects the special test string (Despamilator.gtubs_test_string) and assigns a big score.'
    end

    def parse subject
      subject.register_match!(score: 100, filter: self) if subject.text == Despamilator.gtubs_test_string
    end

  end

end