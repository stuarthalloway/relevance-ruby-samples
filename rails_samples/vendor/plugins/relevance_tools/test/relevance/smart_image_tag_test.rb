require File.join(File.dirname(__FILE__), '/../test_helper')
require 'action_controller'
require 'action_view'
require 'relevance/smart_image_tag'

class SmartImageTagTest < Test::Unit::TestCase
  include ActionView::Helpers::AssetTagHelper
  include FlexMock::TestCase

  def setup
    @helper = Object.new
    @helper.extend ActionView::Helpers::AssetTagHelper
    @helper.extend ActionView::Helpers::TagHelper
  end  

  def test_should_use_alt_for_title
    assert_image_tag_options({:alt => 'foo'}, {:alt => 'foo', :title => 'foo'})
  end
  
  def test_should_use_title_for_alt
    assert_image_tag_options({:title => 'foo'}, {:alt => 'foo', :title => 'foo'})
  end
  
  def test_should_use_title_for_alt_with_other_options
    assert_image_tag_options({:title => 'foo', :size => '2x4'}, {:alt => 'foo', :title => 'foo', :size => '2x4'})
  end

  def test_should_fallback_to_default_rails_impl_with_no_options
    flexmock(@helper).should_receive(:image_tag).with('some_image.png', {}).once
    @helper.smart_image_tag('some_image.png')
  end

  def test_should_fallback_to_default_rails_impl_with_options
    assert_image_tag_options({:border => 0}, {:border => 0})
  end

  def test_smart_image_tag_when_alt_and_title_are_different
    assert_image_tag_options({:alt => 'foo', :title => 'bar'}, {:alt => 'foo', :title => 'bar'})
  end
  
  private
  # We want to make sure smart_image_tag turns around and calls Rails image_tag with 
  # the correct options, so we mock out the helper to check that.
  def assert_image_tag_options(input_options, expected_output_options)
    flexmock(@helper).should_receive(:image_tag).with('some_image.png', expected_output_options).once
    @helper.smart_image_tag('some_image.png', input_options)
  end
end
