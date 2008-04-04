require File.dirname(__FILE__) + '/../test_helper'

describe "Widget json" do
  fixtures :widgets
  
  # Note that we are not testing the serialized format directly, which
  # would run afoul of the unordered nature of hashes in both Ruby and JSON.
  # Instead, we convert back with JSON.decode and test that.
  it "to_custom_json" do
    widgets = [widgets(:one)]
    json = Widget.to_custom_json(widgets)
    decoded = ActiveSupport::JSON.decode(json)
    assert_equal([{"items"=>
                   [{"updated_at"=>"2007-11-27 09:32:53 EST",
                     "type"=>"widget",
                     "id"=>1,
                     "color"=>"blue",
                     "label"=>"smurf",
                     "created_at"=>"2007-11-27 09:32:53 EST"}]}],
      decoded)
  end
end
