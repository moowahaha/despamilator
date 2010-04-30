def name
  'IP Address URL'
end

def description
  'Detects IP address URLs'
end

def parse
  self.append_score = 0.5 if (self.text.downcase.scan(/http:\/\/\d+\.\d+\.\d+\.\d+/).length > 0)
end
