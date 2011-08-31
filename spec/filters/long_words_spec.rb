describe DespamilatorFilter::LongWords do

  the_name_should_be 'Long Words'
  the_description_should_be 'Detects long and unbroken strings'

  despamilator_should_apply_the_filter_for('honorificabilitudinitatibus')

  a_single_match_of('honorificabilitudinitatibus', should_score: 0.1)
  a_multiple_match_of('honorificabilitudinitatibus antidisestablishmentarianism', should_score: 0.2)

end
