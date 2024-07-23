require 'despamilator/filter'

module DespamilatorFilter

  class IPAddressURL < Despamilator::Filter

    def name
      'IP Address URL'
    end

    def description
      'Detects IP address URLs'
    end

    def parse subject
      subject.register_match!({
          :score => 0.5, :filter => self
      }) if Despamilator::Text.count(subject.text.downcase, /http:\/\/\d+\.\d+\.\d+\.\d+/) > 0
    end

  end

end
