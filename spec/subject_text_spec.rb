describe Despamilator::Subject::Text do
  it 'should be a kind of string' do
    Despamilator::Subject::Text.new('aa').should be_kind_of(String)
  end

  it 'should be immutable' do
    text = Despamilator::Subject::Text.new('aa')
    -> {text.gsub!('a', 'b')}.should raise_error(RuntimeError)
  end

  it 'should strip urls' do
    Despamilator::Subject::Text.new(
        'blah https://www.google.com de http://yahoo.com blah http://www.dcyder.com blah'
    ).without_uris.should == 'blah  de  blah  blah'
  end

  it 'should split into words' do
    Despamilator::Subject::Text.new(
        'hello   there you-rule'
    ).words.should == %w{hello there you rule}
  end

  it 'should count the matches for a regular expression' do
    Despamilator::Subject::Text.new(
        'yXyXy'
    ).count(/X/).should == 2
  end

  it 'should count the matches for a regular expression' do
    text = Despamilator::Subject::Text.new('yXyXy').dup
    text.remove_count!(/X/).should == 2
    text.should == 'yyy'
  end

end