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
      count = count_and_strip(text, /[a-z][A-Z]/)
      count += count_and_strip(text, /[a-z][A-Z][a-z]/)
      subject.register_match!({:score => 0.1 * count, :filter => self}) if count > 0
    end

    private

    def count_and_strip text, regexp
      count = text.scan(regexp).length
      text.gsub!(regexp, '')
      count
    end
  end

end