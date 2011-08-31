describe DespamilatorFilter::URLs do

  the_name_should_be 'URLs'
  the_description_should_be 'Detects each url in a string'

  despamilator_should_apply_the_filter_for('http://www.blah.com')

  a_single_match_of('http://www.blah.com', should_score: 0.4)
  a_multiple_match_of('http://www.blah.com http://www.poop.com', should_score: 0.8)

  it 'should only match up to 2 urls' do
    parsing('http://www.blah.com http://www.poop.com http://www.dcyder.com').should have_score(0.8)
  end
end