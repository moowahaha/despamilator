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
      text = Despamilator::Text.without_uris(subject.text).downcase

      text.gsub!(/\w&\w/, 'xx')
      text.gsub!(/[a-z](!|\?)(\s|$)/, 'x')
      text.gsub!(/(?:#{punctuation}){20,}/, '')

      text, matches1 = Despamilator::Text.remove_and_count(text, /(?:\W|\s|^)(#{punctuation})/)
      text, matches2 = Despamilator::Text.remove_and_count(text, /\w,\w/)
      text, matches3 = Despamilator::Text.remove_and_count(text, /\w\w\.\w/)
      text, matches4 = Despamilator::Text.remove_and_count(text, /\w\.\w\w/)
      text, matches5 = Despamilator::Text.remove_and_count(text, /(#{punctuation})(#{punctuation})/)
      text, matches6 = Despamilator::Text.remove_and_count(text, /(#{punctuation})$/)
      _, matches7 = Despamilator::Text.remove_and_count(text, /(?:\W|\s|^)\d+(#{punctuation})/)

      matches = matches1 + matches2 + matches3 + matches4 + matches5 + matches6 + matches7

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
