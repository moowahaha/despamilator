describe DespamilatorFilter::WeirdPunctuation do

  the_name_should_be 'Weird Punctuation'
  the_description_should_be 'Detects unusual use of punctuation.'

  despamilator_should_apply_the_filter_for('^this^')

  a_single_match_of('&gt', should_score: 0.02)
  a_multiple_match_of('%D :-D &gt;:-[ 123, l 89.', should_score: 0.1)

  it 'should score dots and commas mid word' do
    parsing('aa.bb a,e').should have_score(0.04)
  end

  it 'should ignore weird punctuation in urls' do
    parsing('http://www.blah.com?x=1&y=z').should have_score(0)
  end

  it 'should ignore initials' do
    parsing('a.b.c').should have_score(0)
  end

  it 'should ignore ampersands surrounded by letters' do
    parsing('j&r').should have_score(0)
  end

  it 'should ignore end of word quotes' do
    parsing(%Q{'me' and "them"}).should have_score(0)
  end

  it 'should ignore end of word commas and fullstops' do
    parsing('that, that and that.').should have_score(0)
  end

  it 'should ignore end of word bangs and question marks' do
    parsing('you there! will you stop?').should have_score(0)
  end

  it 'should attempt to ignore f**king ascii art signatures' do
    parsing(%q{
omg i love this stuff
-+-+-+-+-+-+-+-
some loser
            }).should have_score(0.16)
  end
end