require 'despamilator/filter_base'

module DespamilatorFilter

  class UnusualCharacters < Despamilator::FilterBase

    def name
      'Unusual Characters'
    end

    def description
      'Detects and scores each occurrence of an unusual 2 or 3 character combination'
    end

    def parse text
      initialize_combos
      tokenize(text).each do |token|
        self.append_score = 0.05 if @@combos[token.to_sym]
      end
    end

    private

    def tokenize text
      tokens = []
      text.downcase.split(/[^a-z]/).each do |word|
        word.chars.each_with_index do |c, i|
          substr = word[i,i+3]
          tokens << substr.to_sym if substr.length == 3
          tokens << substr[0,2].to_sym if substr.length > 1
        end
      end
      tokens
    end

    def initialize_combos
      @@combos ||= {}
      return @@combos unless @@combos.empty?

      File.open(File.join(File.dirname(__FILE__), %w{.. .. .. conf unusual_characters.txt}), 'r').each do |line|
        @@combos[line.strip.to_sym] = true
      end
    end

  end

end
