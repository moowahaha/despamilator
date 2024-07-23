module DespamilatorFilter

  class ObfuscatedURLs < Despamilator::Filter
    def name
      'Obfuscated URLs'
    end

    def description
      'Finds lame attempts at obfuscating urls.'
    end

    def parse subject
      text = Despamilator::Text.without_uris(subject.text.downcase)
      count = find_space_separated_parts text
      count += find_space_separated_characters text

      # weird maths below is due to some issue with ruby 1.9.2 multiplying floats by 3 (?!)
      subject.register_match!({:score => (4.0 * count) / 10, :filter => self}) if count > 0
    end

    private

    def find_space_separated_parts text
      Despamilator::Text.count(text, /www\s+\w+\s+com/)
    end

    def find_space_separated_characters text
      count = 0

      text.split(/[a-z][a-z]/).each do |candidate|
        candidate.strip!
        candidate.gsub!(/\s+/, '')
        count += 1 if candidate =~ /\w{5,}\.\w{2,3}/
      end

      count
    end

  end

end