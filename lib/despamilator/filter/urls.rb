require 'despamilator/filter_base'

module DespamilatorFilter

  class URLs < Despamilator::FilterBase

    def name
      'URLs'
    end

    def description
      'Detects each url in a string'
    end

    def parse text
      text.downcase!

      text.gsub!(/http:\/\/\d+\.\d+\.\d+\.\d+/, '')

      1.upto(text.scan(/http:\/\//).length) do
        self.append_score = 0.4
      end
    end

  end

end
