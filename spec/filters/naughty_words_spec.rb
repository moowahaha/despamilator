describe DespamilatorFilter::NaughtyWords do

  the_name_should_be 'Naughty Words'
  the_description_should_be 'Detects cheeky words'

  despamilator_should_apply_the_filter_for('bondage')

  a_single_match_of('bondage', should_score: 0.1)
  a_multiple_match_of('viagra penis', should_score: 0.2)

end