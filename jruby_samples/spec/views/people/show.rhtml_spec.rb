require File.dirname(__FILE__) + '/../../spec_helper'

describe "/people/show.rhtml" do
  include PeopleHelper
  
  before do
    @person = mock_model(Person)

    assigns[:person] = @person
  end

  it "should render attributes in <p>" do
    render "/people/show.rhtml"
  end
end

