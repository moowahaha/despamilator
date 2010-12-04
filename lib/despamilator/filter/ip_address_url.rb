require 'despamilator/filter_base'

module DespamilatorFilter

  class IpAddressUrl < Despamilator::FilterBase

    def name
      'IP Address URL'
    end

    def description
      'Detects IP address URLs'
    end

    def parse text
      ip_matches = text.downcase.scan(/http:\/\/\d+\.\d+\.\d+\.\d+/).length

      self.append_score = 0.5 if ip_matches > 0

      2.upto(ip_matches) {self.append_score = 0}
    end

  end

end
