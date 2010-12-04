require 'despamilator/filter_base'

module DespamilatorFilter

  class ScriptTag < Despamilator::FilterBase

    def parse text
      self.append_score = 1 if text.downcase.match(/<\/?script(>|\s+|\n|\r)/)
    end

    def name
      'Script tag'
    end

    def description
      'Searches for variations for the HTML script tag'
    end

  end

end
