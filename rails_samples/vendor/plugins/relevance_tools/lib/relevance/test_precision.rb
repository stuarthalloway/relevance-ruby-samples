class Test::Unit::TestCase
  def self.test_precision(attr_symbol, options={})
    define_method("test_#{attr_symbol}_precision") do
      column = model_class_under_test.columns.detect { |e| e.name == attr_symbol.to_s }
      assert_equal options[:precision], column.precision, "Expected precision to be #{options[:precision]}, but was #{column.precision}"
      assert_equal options[:scale], column.scale, "Expected scale to be #{options[:scale]}, but was #{column.scale}"
    end
  end
end