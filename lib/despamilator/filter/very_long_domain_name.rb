require 'despamilator/filter'

module DespamilatorFilter

  class VeryLongDomainName < Despamilator::Filter

    def name
      'Very Long Domain Name'
    end

    def description
      'Detects unusually long domain names.'
    end

    def parse subject
      subject.text.scan(URI.regexp).each do |url|
        domain = url.compact[1]
        subject.register_match!({:score => 0.4, :filter => self}) if domain.length > 20
      end
    end

  end

end
