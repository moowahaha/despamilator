describe DespamilatorFilter::NoVowels do

  the_name_should_be 'No Vowels'
  the_description_should_be 'Detects things that are all letters but no vowels and separated by spaces'

  despamilator_should_apply_the_filter_for('twshdh')

  a_single_match_of('Try The lazy brown fox jumped 25 times over http://www.google.com.au for a gthrrt', should_score: 0.01)
  a_multiple_match_of('The lazy brown fox jumped 25 times gthrrt over http://www.google.com.au for a gthrrt', should_score: 0.04)
  a_multiple_match_of('kjmnllpw wstrtffg The lazy brown  fox jumped 25 ffgfvvfvr times over gthrrt http://www.google.com.au for a gthrrt ', should_score: 0.25)

end