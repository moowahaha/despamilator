def parse
  if self.text.downcase.match(/<\/?script(>|\s+|\n|\r)/)
    self.append_score = 1
  end
end

def name
  'Detects script tags in text'
end

def description
  'Searches for variations for the HTML script tag'
end
