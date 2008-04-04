require 'erb'

module Relevance; end
module Relevance::Validations; end
module Relevance::Validations::ValidatesOrderOf
  # do not mix strings and numerics
  # If you do you will need to find something smarter than ActiveRecord::ConnectionAdapters::Column#type_cast
  def validates_order_of(*attr_names)
    configuration = { :message => "<%= previous_attr_name %> must be <%= configuration[:order] %> <%= attr_name %>", 
                      :on => :save, :allow_nil => false, :order => "<="}
    configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)

    # can't use validates_each, need outer scope to reset previous_attr_name and previous_value!
    send(validation_method(configuration[:on])) do |record|
      previous_attr_name = previous_value = nil
      attr_names.each do |attr_name|
        value = record.send(attr_name)
        if value.nil?
          record.errors.add_on_blank(attr_name,
            ActiveRecord::Errors.default_error_messages[:blank]) unless configuration[:allow_nil]
        else
          unless previous_value.nil? || previous_value.send(configuration[:order], value)
            if block_given?
              yield record
            else
              record.errors.add(attr_name, ERB.new(configuration[:message]).result(binding)) 
            end
          end  
          previous_attr_name, previous_value = attr_name, value
        end #unless
      end #if
    end #send
  end #method
end #class

ActiveRecord::Base.extend(Relevance::Validations::ValidatesOrderOf)
