describe DespamilatorFilter::IPAddressURL do

  the_name_should_be 'IP Address URL'
  the_description_should_be 'Detects IP address URLs'

  despamilator_should_apply_the_filter_for('http://12.34.56.78/')

  a_single_match_of('http://12.34.56.78/', should_score: 0.5)
  a_multiple_match_of('http://12.34.56.78/ http://98.76.54.32/', should_score: [0.5, 1.times])

end