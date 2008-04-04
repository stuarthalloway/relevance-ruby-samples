module Relevance; end
# Augments Rails' validation errors with validation *warnings*
# Usage:
# 1. Include Relevance::ValidatesAsWarning in an AR class (or AR::Base)
# 2. add :warning=>true to any validation that should be warning, not error
# See the unit test for examples
module Relevance::ValidatesAsWarning
  def self.included(base)
    base.extend(ClassMethods)              
  end
  attr_accessor :warnings
  attr_writer :errors
  # Yuck: you must call valid? first 
  # If warnings calls valid? internally you end up running validations twice
  def warnings?
    !warnings.empty?
  end
  def valid?
    warnings.clear if warnings
    super
  end
  module ClassMethods
    # TODO: three different validate methods: validate_on_create, validate_on_update
    def validate(*args,&blk)
      if block_given?
        # TODO: refactor new block creationg into a helper method
        configuration = eval("configuration", blk.binding)
        new_blk = if configuration[:warning]
          Proc.new {|record|
            record.warnings ||= ActiveRecord::Errors.new(record)
            record.warnings, record.errors = record.errors, record.warnings
            begin
              blk.call(record)
            ensure
              record.warnings, record.errors = record.errors, record.warnings
            end
          }
        else
          blk
        end
      end
      super(*args,&new_blk)
    end
  end
end
  