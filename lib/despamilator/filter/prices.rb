module DespamilatorFilter

  class Prices < Despamilator::Filter
    SCORE = 0.0 # Original was 0.075

    def name
      'Prices'
    end

    def description
      'Detects prices in text.'
    end

    def parse subject
      price_count = subject.text.count(/\$\s*\d+/)
      subject.register_match!({:score => SCORE * price_count, :filter => self}) if price_count > 0
    end

  end

end
