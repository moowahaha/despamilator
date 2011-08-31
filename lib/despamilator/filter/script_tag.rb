require 'despamilator/filter'

module DespamilatorFilter

  class ScriptTag < Despamilator::Filter

    def parse subject
      subject.register_match!({:score => 1, :filter => self}) if subject.text.downcase.match(/<\/?script(>|\s+|\n|\r)/)
    end

    def name
      'Script tag'
    end

    def description
      'Searches for variations for the HTML script tag'
    end

  end

end
