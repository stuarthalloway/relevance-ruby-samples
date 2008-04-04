# codecite init
$:.unshift "#{File.dirname(__FILE__)}/lib"
require 'active_record/acts/notable'
ActiveRecord::Base.class_eval { include ActiveRecord::Acts::Notable }
# codecite init