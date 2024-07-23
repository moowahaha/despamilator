require 'despamilator/filter'

module DespamilatorFilter

  class TrailingNumber < Despamilator::Filter

    def name
      'Trailing Number'
    end

    def description
      'Detects a trailing cache busting number'
    end

    def parse subject
      subject.register_match!({:score => 0.1, :filter => self}) if Despamilator::Text.without_uris(subject.text) =~ /\b\d+\s*$/
    end

  end

end