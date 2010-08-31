def name
  'Naughty Q'
end

def description
  'Detects possible misuse of the letter Q (English language)'
end

def parse
  post_matches = self.text.downcase.scan(/q(\w|\d)/)
  pre_matches = self.text.downcase.scan(/(\w|\d)q/)

  matches = post_matches + pre_matches

  return unless matches

  matches.each do |match|
    match = match.first
    self.append_score = 0.2 unless match == 'u' or match == 'a' or match == 'k'
  end
end