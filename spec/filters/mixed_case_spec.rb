describe DespamilatorFilter::MixedCase do
  the_name_should_be 'Mixed Case String'
  the_description_should_be 'Detects mixed case strings.'

  despamilator_should_apply_the_filter_for('hELLo')

  a_single_match_of('yOu', should_score: 0.1)
  a_multiple_match_of('yOu rulE', should_score: 0.2)

  it 'should ignore urls' do
    parsing('http://www.OhMyGod.com').should have_score(0)
  end
end