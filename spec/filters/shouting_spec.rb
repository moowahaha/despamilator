describe DespamilatorFilter::Shouting do

  the_name_should_be 'Shouting'
  the_description_should_be 'Detects and scores shouting (all caps)'

  despamilator_should_apply_the_filter_for('this lil string is 50 PERCENT SHOUTING')

  a_single_match_of('this lil string is 50 PERCENT SHOUTING', should_score: 0.25)
  a_multiple_match_of('HELLO THERE!! THIS IS SHOUTING!!', should_score: 0.5)

  describe "exceptions" do

    it "should strip out HTML" do
      parsing('<H1>this is a flipping html tag whose contents is very long</h1>').should have_score(0)
    end

    it "should ignore strings less than 20 characters long" do
      parsing('ABCD EFG HIJKLM NOP').should have_score(0)
    end

  end

  [
          ['this is a lowercased string', 0],
          ['This is a String with Capital Letters', 0],
          ['this lil string is 50 PERCENT SHOUTING', 0.25],
          ['THIS LIL STRING IS 100 PERCENT SHOUTING', 0.5]
  ].each do |string, expected_score|

    it "should score the string '#{string}' based on a percentage of uppercase words" do
      parsing(string).should have_score(expected_score)
    end

  end

end