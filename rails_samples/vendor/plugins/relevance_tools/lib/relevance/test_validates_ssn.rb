class Test::Unit::TestCase
  def self.test_validates_ssn(field_symbol)
    field = field_symbol.to_s
    define_method("test_#{field}_is_valid_ssn") do
      model = model_class_under_test.new
      model.send("#{field}=", '123456789')
      assert !model.valid?, "SSN validation did not run against field #{field}"
      field_errors = model.errors.on(field_symbol)
      assert field_errors.include?('must be of format ###-##-####'), "Incorrect validation message for field #{field}"
    end
  end
end