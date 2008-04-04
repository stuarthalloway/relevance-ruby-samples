require File.dirname(__FILE__) + '/../../spec_helper'

describe "/people/edit.rhtml" do
  include PeopleHelper
  
  before do
    @person = mock_model(Person)
    assigns[:person] = @person
  end

  it "should render edit form" do
    render "/people/edit.rhtml"
    
    response.should have_tag("form[action=#{person_path(@person)}][method=post]") do
    end
  end
end


