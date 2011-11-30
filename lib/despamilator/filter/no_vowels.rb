require 'despamilator/filter'

module DespamilatorFilter

  class NoVowels < Despamilator::Filter

    NO_VOWELS_REGEX = /^[b-df-hj-np-tv-xzB-DF-HJ-NP-TV-XZ]+$/

    def name
      'No Vowels'
    end

    def description
      'Detects things that are all letters but no vowels and separated by spaces'
    end

    def parse(subject)
      words = subject.text.split(/\s+/).select{|str| str.match(NO_VOWELS_REGEX)}
      unless words.empty?
        subject.register_match!({:score => ((words.length ** 2).to_f / 100) , :filter => self})
      end
    end
  end
end
