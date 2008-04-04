require File.dirname(__FILE__) + '/../../spec_helper'

describe "/people/index.rhtml" do
  include PeopleHelper
  
  before do
    person_98 = mock_model(Person, 
                           :first_name=>"Stu",
                           :last_name=>"Halloway")
    person_99 = mock_model(Person, :first_name=>"Darwin",
                           :last_name=>"Halloway")

    assigns[:people] = [person_98, person_99]
  end

  it "should render list of people" do
    render "/people/index.rhtml"
  end
end

