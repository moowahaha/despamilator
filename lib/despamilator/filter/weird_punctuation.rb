require 'despamilator/filter'

module DespamilatorFilter

  class WeirdPunctuation < Despamilator::Filter

    def name
      'Weird Punctuation'
    end

    def description
      'Detects unusual use of punctuation.'
    end

    def parse subject
      text = subject.text.without_uris.downcase

      text.gsub!(/\w&\w/, 'xx')
      text.gsub!(/[a-z](!|\?)(\s|$)/, 'x')
      text.gsub!(/(?:#{punctuation}){20,}/, '')
      matches = text.remove_and_count!(/(?:\W|\s|^)(#{punctuation})/)
      matches += text.remove_and_count!(/\w,\w/)
      matches += text.remove_and_count!(/\w\w\.\w/)
      matches += text.remove_and_count!(/\w\.\w\w/)
      matches += text.remove_and_count!(/(#{punctuation})(#{punctuation})/)
      matches += text.remove_and_count!(/(#{punctuation})$/)
      matches += text.remove_and_count!(/(?:\W|\s|^)\d+(#{punctuation})/)

      subject.register_match!({:score => 0.03 * matches, :filter => self}) if matches > 0
    end

    private

    def punctuation
      @punctuation ||= %w{~ ` ! @ # $ % ^ & * _ - + = , / ? | \\ : ;}.map do |punctuation_character|
        Regexp.escape(punctuation_character)
      end.join('|')

      @punctuation
    end

  end

end
