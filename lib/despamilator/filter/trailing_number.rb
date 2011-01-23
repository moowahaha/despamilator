require 'despamilator/filter_base'

module DespamilatorFilter

  class TrailingNumber < Despamilator::FilterBase

    def name
      'Trailing Number'
    end

    def description
      'Detects a trailing cache busting number'
    end

    def parse text
      self.append_score = 0.1 if text =~ /\b\d+\s*$/
    end

  end

end