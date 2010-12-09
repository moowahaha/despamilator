describe DespamilatorFilter::FunkyConsonant do
  the_name_should_be 'Funky Consonant'
  the_description_should_be 'Detects and scores each occurrence of a consonant next to an unlikely character'

  despamilator_should_apply_the_filter_for('zt')  

  a_single_match_of('zt', should_score: 0.05)
  a_multiple_match_of('ztzt', should_score: [0.1, 2.times])
end