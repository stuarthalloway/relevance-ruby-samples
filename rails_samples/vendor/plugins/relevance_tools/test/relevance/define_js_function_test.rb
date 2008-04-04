require File.join(File.dirname(__FILE__), '/../test_helper')
require 'action_controller'
require 'action_view'
require 'relevance/define_js_function'

class DefineJsFunctionTest < Test::Unit::TestCase
  include ActionView::Helpers::JavascriptHelper
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::TagHelper
  
  def test_define_js_function_without_body
    expected = "<script type=\"text/javascript\">\n//<![CDATA[\nfunction foo {\n}\n//]]>\n</script>"
    assert_equal expected, define_js_function('foo') {}
  end
  
  def test_define_js_function
    expected = "<script type=\"text/javascript\">\n//<![CDATA[\nfunction foo {\nalert(\"hello world\");\n}\n//]]>\n</script>"
    assert_equal expected, define_js_function('foo') { |page| page.alert('hello world') }
  end
end