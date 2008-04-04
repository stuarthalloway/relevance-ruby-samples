require File.join(File.dirname(__FILE__), "/../test_helper")
require 'relevance/path'

class PathMixinTest < Test::Unit::TestCase
  include Relevance::PathMixin

  BASE_PATH = File.dirname(__FILE__)
  
  def test_good_path
    assert(is_subpath(BASE_PATH, File.join(BASE_PATH, 'path_test.rb')))
    assert(is_subpath(BASE_PATH, BASE_PATH))
  end

  def test_crawl_up
    assert(!is_subpath(File.join(BASE_PATH, 'path_test.rb'), BASE_PATH))
    assert(!is_subpath(BASE_PATH, File.join(BASE_PATH, '../..')))
  end
  
  def test_nonexistent
    assert(!is_subpath(File.join(BASE_PATH, 'nonexistent'), BASE_PATH))
    assert(is_subpath(BASE_PATH, File.join(BASE_PATH, 'nonexistent')))
  end
end