module DespamilatorFilter

  class MixedCase < Despamilator::Filter
    def name
      'Mixed Case String'
    end

    def description
      'Detects mixed case strings.'
    end

    def parse subject
      text = subject.text.without_uris
      count = text.remove_and_count!(/[a-z][A-Z]/)
      count += text.remove_and_count!(/[a-z][A-Z][a-z]/)
      subject.register_match!({:score => 0.1 * count, :filter => self}) if count > 0
    end

  end

end