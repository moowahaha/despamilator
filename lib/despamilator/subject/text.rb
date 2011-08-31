require 'uri'

class Despamilator
  class Subject
    class Text < String

      def initialize text
        super text
        freeze
      end

      def without_uris
        self.gsub(URI.regexp(['http', 'https', 'mailto', 'ftp']), '')
      end

      def words
        self.split(/\W+/)
      end

    end
  end
end