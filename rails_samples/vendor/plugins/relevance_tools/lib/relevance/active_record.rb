# Relevance::ActiveRecord is declared and mixed in here, 
# actual methods live in their own source files
module Relevance
  module ActiveRecord
    module InstanceMethods; end
  end
end

ActiveRecord::Base.class_eval {include Relevance::ActiveRecord::InstanceMethods}