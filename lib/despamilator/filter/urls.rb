require 'despamilator/filter'

module DespamilatorFilter

  class URLs < Despamilator::Filter

    def name
      'URLs'
    end

    def description
      'Detects each url in a string'
    end

    def parse subject
      text = subject.text.downcase.gsub(/http:\/\/\d+\.\d+\.\d+\.\d+/, '')
      matches = Despamilator::Text.count(text, /https?:\/\/\S+/)
      1.upto(matches > 2 ? 2 : matches) do
        subject.register_match!({:score => 0.4, :filter => self})
      end
    end

  end

end
