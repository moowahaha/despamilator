module DespamilatorFilter

  class MixedCase < Despamilator::Filter
    def name
      'Mixed Case String'
    end

    def description
      'Detects mixed case strings.'
    end

    def parse subject
      text = Despamilator::Text.without_uris(subject.text)
      text, count1 = Despamilator::Text.remove_and_count(text, /[a-z][A-Z]/)
      _, count2 = Despamilator::Text.remove_and_count(text, /[a-z][A-Z][a-z]/)

      count = count1 + count2

      subject.register_match!({:score => 0.1 * count, :filter => self}) if count > 0
    end

  end

end