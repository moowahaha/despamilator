require 'despamilator/filter_base'

module DespamilatorFilter

  class FunkyConsonant < Despamilator::FilterBase

    def name
      'Funky Consonant'
    end

    def description
      'Detects and scores each occurrence of a consonant next to an unlikely character'
    end

    def parse text
      text.downcase!

      consonant_pairs.each do |pair|
        [pair, pair.reverse].each do |combo_pair|
          self.append_score = 0.05 unless text.scan(/#{combo_pair}/).empty?
        end
      end
    end

    def consonant_pairs
      %w{ zt gb vk vt jk mj dm jm xz bn }
    end
    
  end

end
