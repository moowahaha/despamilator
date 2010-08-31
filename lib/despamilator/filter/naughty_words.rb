def name
  'Naughty Words'
end

def description
  'Detects cheeky words'
end

def parse
  text = self.text.downcase

  naughty_words.each do |word|
    self.append_score = 0.1 if text =~ /\b#{word}\b/
  end
end

def naughty_words
  %w{
    penis
    viagra
    bondage
    cunt
    fuck
    shit
    dick
    tits
  }
end