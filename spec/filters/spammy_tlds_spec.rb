describe DespamilatorFilter::SpammyTLDs do

  the_name_should_be 'Spammy TLDs'
  the_description_should_be 'Detects TLDs that are more commonly associated with spam.'

  despamilator_should_apply_the_filter_for('http://www.blahrrg.info')

  a_single_match_of('http://www.blahdee.biz', should_score: 0.05)
  a_multiple_match_of('http://www.blahdee.info http://www.poopy.biz', should_score: 0.1)
  
end