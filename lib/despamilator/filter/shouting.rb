require 'despamilator/filter'

module DespamilatorFilter

  class Shouting < Despamilator::Filter

    def name
      'Shouting'
    end

    def description
      'Detects and scores shouting (all caps)'
    end

    def parse subject
      # strip HTML
      text = subject.text.gsub(/<\/?[^>]*>/, "")

      return if text.length < 20

      uppercased = text.scan(/[A-Z][A-Z]+/).join.length
      lowercased = Despamilator::Text.count(text, /[a-z]/)

      if uppercased > 0
        subject.register_match!({
            :score => (uppercased.to_f / (uppercased + lowercased)) * 0.5,
            :filter => self
        })
      end
    end

  end

end
