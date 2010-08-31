require File.dirname(__FILE__) + '/spec_helper.rb'
require File.dirname(__FILE__) + '/../lib/despamilator/validation.rb'

class TestClass
  include ActiveRecord::Validations::ClassMethods
end

describe 'despamilator validation' do

  # worst test i have ever written?
  it "should validate my field" do
    fake_record = mock('fake record')

    tc = TestClass.new
    tc.should_receive(:validates_each).with([:something], {:on=>:save, :message=>"has exceeded the spam threshold of 1"}).and_yield(fake_record, :something, 'bob')

    tc.validates_despamilation_of :something, :threshold => 1
  end

end