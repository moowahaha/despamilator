describe DespamilatorFilter::WeirdPunctuation do

  the_name_should_be 'Weird Punctuation'
  the_description_should_be 'Detects unusual use of punctuation.'

  despamilator_should_apply_the_filter_for('^this^')

  a_single_match_of('&gt', should_score: 0.015)
  a_multiple_match_of('%D :-D &gt;:-[ 123, l 89.', should_score: 0.075)

  it 'should ignore weird punctuation in urls' do
    parsing('http://www.blah.com?x=1&y=z').should have_score(0)
  end

  it 'should ignore ampersands surrounded by letters' do
    parsing('j&r').should have_score(0)
  end
end