require 'despamilator/filter'

module DespamilatorFilter

  class SquareBrackets < Despamilator::Filter

    def name
      'Square Brackets'
    end

    def description
      'Detects each square bracket in a string'
    end

    def parse subject
      subject.text.downcase.scan(/(\[|\])/).each do |match|
        subject.register_match!({:score => 0.05, :filter => self})
      end
    end

  end

end
