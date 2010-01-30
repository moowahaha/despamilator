def parse
  string = self.text.downcase

  # strip out "good numbers"
  string.gsub!(/h[1-6]/, '')
  string.gsub!(/(^|\b)\d+($|\b)/, '')
  string.gsub!(/(^|\b)\d+(,|\.)\d+($|\b)/, '')
  string.gsub!(/(^|\b)\d+(st|nd|rd|th)($|\b)/, '')

  [
          /\w\d+/,
          /\d+\w/,
          /\d+($|\b)/
  ].each do |regexp|
    matches = string.scan(regexp)

    next if matches.empty?

    matches.each do |to_remove|
      to_remove = to_remove.to_s
      string.sub!(to_remove, '') unless to_remove.empty?
      self.append_score = 0.1
    end
  end
end

def name
  'Numbers next to words'
end

def description
  'Detects unusual number/word combinations'
end