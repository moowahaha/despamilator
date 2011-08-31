describe Despamilator::Subject do

  before do
    @subject = Despamilator::Subject.new('blah blah')
  end

  it 'should have a string version' do
    @subject.text.to_s.should == 'blah blah'
  end

  it 'should have a default score' do
    @subject.score.should == 0.0
  end

  context 'registered filters' do
    before do
      class SomeFilter < Despamilator::Filter
      end
      class AnotherFilter < Despamilator::Filter
      end

      @some_filter = SomeFilter.new
      @another_filter = AnotherFilter.new

      @subject.register_match!(score: 1, filter: @some_filter)
      @subject.register_match!(score: 2, filter: @another_filter)
      @subject.register_match!(score: 3, filter: @some_filter)
    end
    it 'should have a total score' do
      @subject.score.should == 6
    end

    it 'should aggregate results' do
      @subject.matches.should == [{score: 4, filter: @some_filter}, {score: 2, filter: @another_filter}]
    end
  end

end