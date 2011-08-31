describe DespamilatorFilter::NumbersAndWords do

  the_name_should_be 'Numbers next to words'
  the_description_should_be 'Detects unusual number/word combinations'

  despamilator_should_apply_the_filter_for('X5T')

  a_single_match_of('X5T', should_score: 0.1)
  a_multiple_match_of('4g6hk', should_score: 0.2)

  context 'exceptions' do
    it 'should ignore urls' do
      parsing('http://www.blah7l.com').should have_score(0)
    end

    [1, 4, 10, 100000, '1,000,000', '1st', '2nd', '3rd', '4th', '5th', '6th', '10th', '122nd'].each do |number|
      it "should return a blank for a #{number}" do
        parsing(number.to_s).should have_score(0)
      end
    end

    [1, 2, 3, 4, 5, 6].each do |tag_no|
      header_tag = "h#{tag_no}"

      it "should ignore html header tag #{header_tag}" do
        parsing(header_tag).should have_score(0)
      end
    end

  end

end
