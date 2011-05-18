describe DespamilatorFilter::URLs do

  the_name_should_be 'URLs'
  the_description_should_be 'Detects each url in a string'

  despamilator_should_apply_the_filter_for('http://www.blah.com')

  a_single_match_of('http://www.blah.com', should_score: 0.45)
  a_multiple_match_of('http://www.blah.com http://www.poop.com', should_score: [0.90, 2.times])

end