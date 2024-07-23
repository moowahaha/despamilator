require 'despamilator/filter'

module DespamilatorFilter

  class SpammyTLDs < Despamilator::Filter

    def name
      'Spammy TLDs'
    end

    def description
      'Detects TLDs that are more commonly associated with spam.'
    end

    def parse subject
      matches = Despamilator::Text.count(subject.text, /\w{5,}\.(info|biz|xxx)\b/)
      subject.register_match!({:score => 0.05 * matches, :filter => self}) if matches > 0
    end

  end

end
