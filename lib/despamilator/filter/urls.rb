def name
  'URLs'
end

def description
  'Detects each url in a string'
end

def parse
  self.append_score = 0.20 * self.text.downcase.scan(/http:\/\//).length
end
