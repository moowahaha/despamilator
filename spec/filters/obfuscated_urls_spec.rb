describe DespamilatorFilter::ObfuscatedURLs do

  the_name_should_be 'Obfuscated URLs'
  the_description_should_be 'Finds lame attempts at obfuscating urls.'

  despamilator_should_apply_the_filter_for('www blah com')

  a_single_match_of('b a l l s . c o m', should_score: 0.4)
  a_multiple_match_of('www blah com b a l l s . c o m also n u t t s . c o m', should_score: 1.2)

end