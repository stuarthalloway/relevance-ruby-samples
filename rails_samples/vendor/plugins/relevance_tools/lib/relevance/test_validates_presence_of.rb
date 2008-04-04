class Test::Unit::TestCase
  def self.test_validates_presence_of(field)
    define_method("test_#{field}_required") do
      validations = model_class_under_test.reflect_on_all_validations
      validations = validations.select { |e| e.macro == :validates_presence_of }
      field_names = validations.collect(&:name)
      assert field_names.include?(field), "Expected validates_presence_of to be called " <<
                                          "on :#{field}, but it wasn't"
    end
  end
end