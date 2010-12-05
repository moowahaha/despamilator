require File.dirname(__FILE__) + '/../lib/despamilator/validation.rb'

class TestClass
  include DespamilatorValidation

  attr_accessor :text
end

describe 'despamilator validation' do

  it "should validate my field" do
    tc = TestClass.new
    tc.text = 'asdasd'

    fake_despamilator = mock('despamilator')
    Despamilator.should_receive(:new).and_return(fake_despamilator)
    fake_despamilator.should_receive(:score).and_return(2)

    fake_errors = mock('errors')
    tc.should_receive(:errors).and_return(fake_errors)
    fake_errors.should_receive(:add).with(:text, "has exceeded the spam threshold of 1")

    tc.validates_despamilation_of(:text, :threshold => 1)
  end

end