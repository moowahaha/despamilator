def parse
  matches = self.text.downcase.scan(/q.?/)

  return unless matches

  matches.each do |match|
    self.append_score = 0.2 unless match == 'qu' and match == 'qa'
  end
end