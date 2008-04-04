class Test::Unit::TestCase
  
  # Asserts that a numerical value changes by a given amount (the difference)
  # during execution of the passed block. This effectively eliminates the need
  # to, for example, save object counts and check them at the end of each
  # test case. Either a single object can be passed, or an array of objects
  # can be passed. Difference defaults to 1.
  #
  def assert_difference(objects, method, difference=1)
    objects = [objects] unless objects.respond_to?(:each)
    initial_values = objects.collect { |o| o.send(method) }
    yield
    objects.each_with_index do |o, i|
      assert_equal initial_values[i] + difference, o.send(method), "#{o}##{method}"
    end
  end
  
  # Reverses the previous assertion by checking that a numerical value does
  # not change during execution of the passed block.
  #
  def assert_no_difference(objects, method, &block)
    assert_difference objects, method, 0, &block
  end
  
end