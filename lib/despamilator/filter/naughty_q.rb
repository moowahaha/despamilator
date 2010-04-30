def name
  'Naughty Q'
end

def description
  'Detects possible misuse of the letter Q (English language)'
end

def parse
  matches = self.text.downcase.scan(/q(\w|\d)/)

  return unless matches

  matches.each do |match|
    match = match.first
    self.append_score = 0.2 unless match == 'u' or match == 'a'
  end
end