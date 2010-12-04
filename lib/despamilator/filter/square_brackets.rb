require 'despamilator/filter_base'

module DespamilatorFilter

  class SquareBrackets < Despamilator::FilterBase

    def name
      'Square Brackets'
    end

    def description
      'Detects each square bracket in a string'
    end

    def parse text
      text.downcase.scan(/(\[|\])/).each do |match|
        self.append_score = 0.05
      end
    end

  end

end
