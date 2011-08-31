require 'despamilator/filter'
require 'domainatrix'

module DespamilatorFilter

  class VeryLongDomainName < Despamilator::Filter

    def name
      'Very Long Domain Name'
    end

    def description
      'Detects unusually long domain names.'
    end

    def parse subject
      subject.text.scan(URI.regexp).each do |url_parts|
        url_parts.compact!
        next if !url_parts[1] or url_parts[1] !~ /(\w|-){5,}\.\w{2,5}/
        url = Domainatrix.parse('http://' + url_parts[1])
        subject.register_match!({:score => 0.4, :filter => self}) if url.domain.length > 20
      end
    end

  end

end
