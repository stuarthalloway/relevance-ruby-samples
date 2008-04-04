ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'mocha'
require "test/spec"
require "test/spec/rails"

class ActionController::TestCase
  include AuthenticatedTestHelper
end

class Test::Unit::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

end
