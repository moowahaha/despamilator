describe DespamilatorFilter::VeryLongDomainName do
  the_name_should_be 'Very Long Domain Name'
  the_description_should_be 'Detects unusually long domain names.'

  despamilator_should_apply_the_filter_for('http://cje6CgslLk0ds3Nnto7dj.com')

  a_single_match_of('blah http://cje6CgslLk0ds3Nnto7dj.com blah', should_score: 0.4)
  a_multiple_match_of('blah http://cje6CgslLk0ds3Nnto7dj.com?x=jkhkh345kjhkhkj43h5jhjh45 blah http://cje6CgslLk0ds3Nnto7dj.com', should_score: 0.8)
end