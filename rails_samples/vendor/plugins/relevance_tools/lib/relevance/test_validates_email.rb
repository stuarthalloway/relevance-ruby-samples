class Test::Unit::TestCase
  def self.test_validates_email(field_symbol)
    field = field_symbol.to_s
    define_method("test_#{field}_is_valid_email") do
      model = model_class_under_test.new
      model.send("#{field}=", "foobar")
      assert !model.valid?, "e-mail validation did not run against field #{field}"
      field_errors = model.errors.on(field_symbol)
      assert field_errors.include?("is not a valid e-mail address"), "Incorrect validation message for field #{field}"
    end
  end
end