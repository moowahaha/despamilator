describe Despamilator::Text do
  it 'should strip urls' do
    Despamilator::Text.without_uris(
        'blah https://www.google.com de.http://yahoo.com blah http://www.dcyder.com?x={abc} blah'
    ).should == 'blah de.blah blah'
  end

  it 'should split into words' do
    Despamilator::Text.words(
        'hello   there you-rule'
    ).should == %w{hello there you rule}
  end

  it 'should count the matches for a regular expression' do
    Despamilator::Text.count(
        'yXyXy',
        /X/
    ).should == 2
  end

  it 'should count the matches for a regular expression' do
    text, count = Despamilator::Text.remove_and_count('yXyXy', /X/)
    text.should == 'yyy'
    count.should == 2
  end

end