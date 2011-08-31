class Despamilator::Subject
  def has_score? score
    self.score == score
  end
end

def the_name_should_be expected_name
  it 'should have a name' do
    described_class.new.name.should == expected_name
  end
end

def the_description_should_be expected_description
  it 'should have a description' do
    described_class.new.description.should == expected_description
  end
end

def parsing string
  subject = Despamilator::Subject.new(string)
  described_class.new.parse(subject)
  subject
end

def a_single_match_of string, expectation
  describe 'detecting a single match' do

    before :all do
      @subject = Despamilator::Subject.new(string)
      described_class.new.parse(@subject)
    end

    it 'should only match once' do
      @subject.matches.length.should == 1
    end

    it 'should have a score' do
      @subject.score.should == expectation[:should_score]
    end

  end
end

def a_multiple_match_of string, expectation
  describe 'detecting a multiple matches' do

    before :all do
      @subject = Despamilator::Subject.new(string)
      described_class.new.parse(@subject)
    end

    it 'should have a score' do
      @subject.score.should == expectation[:should_score]
    end

  end
end

def despamilator_should_apply_the_filter_for string

    it 'should be applied during filtering' do
      filter_name = described_class.new.name
      despamilator = Despamilator.new(string)
      despamilator.matches.reject { |f| f[:filter].name != filter_name }.compact.should_not be_empty
    end

end