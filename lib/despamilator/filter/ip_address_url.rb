require 'despamilator/filter_base'

module DespamilatorFilter

  class IPAddressURL < Despamilator::FilterBase

    def name
      'IP Address URL'
    end

    def description
      'Detects IP address URLs'
    end

    def parse text
      self.append_score = 0.5 if text.downcase.scan(/http:\/\/\d+\.\d+\.\d+\.\d+/).length > 0
    end

  end

end
