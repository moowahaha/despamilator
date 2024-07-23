require 'despamilator/filter'

module DespamilatorFilter

  class UnusualCharacters < Despamilator::Filter

    def name
      'Unusual Characters'
    end

    def description
      'Detects and scores each occurrence of an unusual 2 or 3 character combination'
    end

    def parse subject
      initialize_combos
      tokenize(Despamilator::Text.without_uris(subject.text)).each do |token|
        subject.register_match!({:score => 0.05, :filter => self}) if @@combos[token.to_sym]
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
