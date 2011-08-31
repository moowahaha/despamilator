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

      1.upto(text.scan(/http:\/\//).length) do
        subject.register_match!({:score => 0.4, :filter => self})
      end
    end

  end

end
