class Test::Unit::TestCase
  def model_class_under_test
    self.class.to_s.gsub(/Test$/, '').constantize
  end
end