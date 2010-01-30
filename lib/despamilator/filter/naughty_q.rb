def name
  'Naughty Q'
end

def description
  'Detects possible misuse of the letter Q (English language)'
end

def parse
  matches = self.text.downcase.scan(/q./)

  return unless matches

  matches.each do |match|
    self.append_score = 0.2 if match != 'qu' and match != 'qa' and match !~ /q\s/
  end
end