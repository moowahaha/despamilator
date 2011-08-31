describe DespamilatorFilter::SquareBrackets do

  the_name_should_be 'Square Brackets'
  the_description_should_be 'Detects each square bracket in a string'

  despamilator_should_apply_the_filter_for('[')

  a_single_match_of('[', should_score: 0.05)
  a_multiple_match_of('[]', should_score: 0.1)

end