describe DespamilatorFilter::NaughtyQ do

  the_name_should_be 'Naughty Q'
  the_description_should_be 'Detects possible misuse of the letter Q (English language)'

  despamilator_should_apply_the_filter_for('qtu')

  a_single_match_of('qtu', should_score: 0.2)
  a_multiple_match_of('qtq', should_score: [0.4, 2.times])

end
