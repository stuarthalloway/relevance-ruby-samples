module Matchers
  class HaveErrorOn
    def initialize(field)
      @field=field
    end
  
    def matches?(model)
      @model=model
      @model.valid?
      !@model.errors.on(@field).nil?
    end
  
    def description
      "have error on #{@field}"
    end
  
    def failure_message
      " expected to have error on #{@field} but doesn't"
    end
  end

  def have_error_on(field)
    HaveErrorOn.new(field)
  end
end