require 'despamilator/filter_base'

module DespamilatorFilter

  class Shouting < Despamilator::FilterBase

    def name
      'Shouting'
    end

    def description
      'Detects and scores shouting (all caps)'
    end

    def parse text
      # strip HTML
      text.gsub!(/<\/?[^>]*>/, "")

      return if text.length < 20

      uppercased = text.scan(/[A-Z]/).length
      lowercased = text.scan(/[a-z]/).length

      if uppercased > 0
        self.append_score = (uppercased.to_f / (uppercased + lowercased)) * 0.5
      end
    end

  end

end
