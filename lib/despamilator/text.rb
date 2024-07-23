require "uri"

class Despamilator
  module Text
    def self.without_uris(text)
      text.gsub(/\b(?:https?|mailto|ftp):.+?(\s|$)/i, "")
    end

    def self.words(text)
      text.split(/\W+/)
    end

    def self.count(text, pattern)
      text.scan(pattern).flatten.compact.length
    end

    def self.remove_and_count(text, pattern)
      count = count(text, pattern)
      [text.gsub(pattern, ""), count]
    end
  end
end
