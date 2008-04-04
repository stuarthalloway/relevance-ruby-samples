require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

# TODO: where is the rspec approved place to hang this kind of method?
class Test::Unit::TestCase
  def login_as(user)
    controller.send :current_user=, user
  end
end
