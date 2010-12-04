require 'despamilator/filter_base'

module DespamilatorFilter

  class LongWords < Despamilator::FilterBase

    def name
      'Long Words'
    end

    def description
      'Detects long and unbroken strings'
    end

    def parse text
      text.split(/\W+/).each do |word|
        self.append_score = 0.1 if word.length > 20
      end
    end

  end

end
