require File.dirname(__FILE__) + '/../spec_helper'

describe FormBuilderExtensions do
  include FormBuilderExtensions

  it "should wrap field as <p><b>LABEL</b><br/>Field</p>" do
    self.should_receive(:some_tag_method).and_return("<some_input_tag/>")
    html = labelled_field(:some_tag_method, :some_field_name)
    html.should have_tag("p") do
      with_tag "label", "Some field name"
      with_tag "br"
      with_tag "some_input_tag"
    end
  end
  
end
