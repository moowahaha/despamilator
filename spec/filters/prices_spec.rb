describe DespamilatorFilter::Prices do

  the_name_should_be 'Prices'
  the_description_should_be 'Detects prices in text.'

  despamilator_should_apply_the_filter_for('$20')

  a_single_match_of('it is $45 DOLLAAA', should_score: 0.075)
  a_multiple_match_of('it is between $20 and $ 25', should_score: 0.15)

end