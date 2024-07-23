module DespamilatorFilter

  class Prices < Despamilator::Filter
    def name
      'Prices'
    end

    def description
      'Detects prices in text.'
    end

    def parse subject
      price_count = Despamilator::Text.count(subject.text,/\$\s*\d+/)
      subject.register_match!({:score => 0.075 * price_count, :filter => self}) if price_count > 0
    end

  end

end