describe DespamilatorFilter::TrailingNumber do

  the_name_should_be 'Trailing Number'
  the_description_should_be 'Detects a trailing cache busting number'

  despamilator_should_apply_the_filter_for('hello 123 ')

  a_single_match_of('hello 123', should_score: 0.1)

  it 'should ignore URLs' do
    parsing('http://www.blah.com?x=2').should have_score(0)
  end

end