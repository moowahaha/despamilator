describe DespamilatorFilter::GtubsTestFilter do
  the_name_should_be 'GTubs Test Filter'
  the_description_should_be 'Detects the special test string (Despamilator.gtubs_test_string) and assigns a big score.'

  despamilator_should_apply_the_filter_for(Despamilator.gtubs_test_string)

  a_single_match_of(Despamilator.gtubs_test_string, should_score: 100)
  a_multiple_match_of(Despamilator.gtubs_test_string, should_score: [100, 1.times])
end