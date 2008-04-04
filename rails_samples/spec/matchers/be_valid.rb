module Matchers
  class BeValid
    def initialize
    
    end
  
    def matches?(model)
      @model=model
      return @model.valid?
    end
  
    def description
      "be valid"
    end
  
    def failure_message
      " expected to be valid, but had the following errors: #{@model.errors.full_messages.to_sentence}"
    end
  
    def negative_failure_message
      " expected to not be valid, but was (missing validation?)"
    end
  end

  def be_valid
    BeValid.new
  end
end