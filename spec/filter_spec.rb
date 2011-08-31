class UnimplementedFilter < Despamilator::Filter
end

describe Despamilator::Filter do
  describe "abstract method" do

    before do
      @filter = UnimplementedFilter.new
    end

    [
            [:name, 'No name defined for UnimplementedFilter'],
            [:description, 'No description defined for UnimplementedFilter'],

    ].each do |method, exception|

      it "should throw an error when the child class has not implemented a '#{method}' method" do
        -> {@filter.send(method)}.should raise_error(exception)
      end

    end

    it "should throw an error when the child class has not implemented a 'parse' method" do
      -> {@filter.parse('abc')}.should raise_error('No parser defined for UnimplementedFilter')
    end

  end
end