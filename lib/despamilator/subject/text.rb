require 'uri'

class Despamilator
  class Subject
    class Text < String

      def initialize text
        super text
        freeze
      end

      def without_uris
        gsub(URI.regexp(['http', 'https', 'mailto', 'ftp']), '')
      end

      def words
        split(/\W+/)
      end

      def count pattern
        scan(pattern).flatten.compact.length
      end

      def remove_and_count! pattern
        count = count(pattern)
        gsub!(pattern, '')
        count
      end

    end
  end
end