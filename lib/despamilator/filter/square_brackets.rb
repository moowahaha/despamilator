def name
  'Square Brackets'
end

def description
  'Detects each square bracket in a string'
end

def parse
  self.text.downcase.scan(/(\[|\])/).each do |match|
    self.append_score = 0.05
  end
end
