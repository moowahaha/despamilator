describe DespamilatorFilter::UnusualCharacters do
  the_name_should_be 'Unusual Characters'
  the_description_should_be 'Detects and scores each occurrence of an unusual 2 or 3 character combination'

  despamilator_should_apply_the_filter_for('sx')

  a_single_match_of('sx', should_score: 0.05)
  a_multiple_match_of('sxsx', should_score: [0.1, 2.times])
end