require 'relevance/active_record'

module Relevance::ActiveRecord::InstanceMethods
  # invalid? often reads much nicer in controller logic, rather then "unless record.valid?"
  def invalid?
    !valid?
  end
end