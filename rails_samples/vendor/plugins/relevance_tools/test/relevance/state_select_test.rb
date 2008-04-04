require File.join(File.dirname(__FILE__), "/../test_helper")
require 'action_controller'
require 'action_view'
require 'relevance/state_select'

class StateSelectTest < Test::Unit::TestCase
  include ActionView::Helpers::FormOptionsHelper
  include FlexMock::TestCase
  
  def test_state_select
    result = state_select(:person, :state)
    assert result.include?('<select id="person_state" name="person[state]">')
    assert result.include?('<option value="-">-</option>')
    assert result.include?('<option value="CO">COLORADO</option>')
    assert result.include?('</select>')
  end
  
  def test_form_builder_state_select
    template = flexmock
    template.should_receive(:state_select).with('name', :state, { :object => 'object' }, {}).and_return('result').once
    form_builder = ActionView::Helpers::FormBuilder.new('name', 'object', template, {}, Proc.new {})
    assert_equal 'result', form_builder.state_select(:state)
  end
end
