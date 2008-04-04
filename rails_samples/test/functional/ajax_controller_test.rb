require File.dirname(__FILE__) + '/../test_helper'
require 'ajax_controller'

# Re-raise errors caught by the controller.
class AjaxController; def rescue_action(e) raise e end; end

class AjaxControllerTest < Test::Unit::TestCase
  def setup
    @controller = AjaxController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @controller.stubs(:current_user)
  end

  def test_create_js_succeeds
    Widget.any_instance.stubs(:save).returns(true)
    xhr :post, :create, {}
    assert_not_nil(assigns(:widget))
    assert_rjs :visual_effect, :blind_up, "model_form", :duration => '1'
    assert_rjs :replace_html, 'model_error', 'Saved!'
  end

  def test_create_js_fails
    Widget.any_instance.stubs(:save).returns(false)
    ActionView::Base.any_instance.stubs(:error_messages_for).returns("boom")
    xhr :post, :create, {}
    assert_not_nil(assigns(:widget))
    assert_rjs :replace_html, 'model_error', "boom"
  end

end
