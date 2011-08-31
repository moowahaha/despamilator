require 'despamilator/filter'

module DespamilatorFilter

  class NaughtyWords < Despamilator::Filter

    def name
      'Naughty Words'
    end

    def description
      'Detects cheeky words'
    end

    def parse subject
      text = subject.text.downcase

      naughty_words.each do |word|
        subject.register_match!(score: 0.1, filter: self) if text =~ /\b#{word}s?\b/
      end
    end

    def naughty_words
      %w{
    underage
    penis
    viagra
    bondage
    cunt
    fuck
    shit
    dick
    tits
    nude
    dicks
    shemale
    dildo
    porn
    cock
    pussy
    clit
    preteen
    lolita
   }
    end

  end
end
