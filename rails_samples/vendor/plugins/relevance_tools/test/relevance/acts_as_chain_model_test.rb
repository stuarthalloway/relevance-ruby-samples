require File.join(File.dirname(__FILE__), "/../test_helper")
require 'mocha'
require 'stubba'
require 'relevance/acts_as_chain_model'

class ActsAsChainModelTest < Test::Unit::TestCase
  def setup
    @obj = Object.new
    @obj.extend ActsAsChainModel
  end
  
  def test_redirect
    @first = {}
    @flash = {}
    @obj.expects(:flash).returns(@flash)
    @obj.expects(:redirect_to).with(:second, :third)
    @obj.chain @first, :second, :third 
    assert_equal({:chain_model => @first}, @flash)
  end

  def test_redirect_with_nonhash_arg
    assert_raises ArgumentError do
      @obj.chain Object.new
    end
  end
  
  def test_fetch_existing_chain_model   
    @hash = {:first => Object.new}
    @flash = {:chain_model => @hash}
    @obj.expects(:flash).returns(@flash)
    assert_equal @hash, @obj.chain_model
  end
  
  def test_fetch_nonexisting_chain_model
    @flash = {}
    @obj.expects(:flash).returns(@flash)
    assert_raises RuntimeError do
      @obj.chain_model
    end
  end
  
end