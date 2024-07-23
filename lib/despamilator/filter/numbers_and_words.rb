require 'despamilator/filter'

module DespamilatorFilter

  class NumbersAndWords < Despamilator::Filter

    def parse subject
      text = tidy_text(subject)

      [
              /\w\d+/,
              /\d+\w/,
              /\d+($|\b)/
      ].each do |regexp|
        matches = text.scan(regexp)

        next if matches.empty?

        matches.each do |to_remove|
          to_remove = to_remove.to_s
          text.sub!(to_remove, '') unless to_remove.empty?
          subject.register_match!({:score => 0.1, :filter => self})
        end
      end
    end

    def name
      'Numbers next to words'
    end

    def description
      'Detects unusual number/word combinations'
    end

    private

    def tidy_text subject
      text = Despamilator::Text.without_uris(subject.text)
      text.downcase!

      # strip out "good numbers"
      text.gsub!(/h[1-6]/, '')
      text.gsub!(/(^|\b)\d+($|\b)/, '')
      text.gsub!(/(^|\b)\d+(,|\.)\d+($|\b)/, '')
      text.gsub!(/(^|\b)\d+(st|nd|rd|th)($|\b)/, '')

      text
    end
  end

end