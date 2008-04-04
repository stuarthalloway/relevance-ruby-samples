require 'erb'
require 'relevance/numeric'

class ActiveRecord::Base
  def self.validates_number(*attr_names)
    configuration = { :on => :save, :message=>"must be a number" }
    configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)

    validates_each(attr_names,configuration) do |record, attr_name,value|
     next unless nil_not_allowed(configuration, record) || proc_returns_true(configuration, record)
      begin
        detail = []
        value = Kernel.Float(record.send("#{attr_name}_before_type_cast").to_s)
        if configuration[:min]
          detail << "at least #{configuration[:min]}" unless value >= configuration[:min]
        end
        if configuration[:max]
          detail << "at most #{configuration[:max]}" unless value <= configuration[:max]
        end
        if configuration[:scale]
          detail << "at most #{configuration[:scale]} decimal places" unless value.scale <= configuration[:scale]
        end
        unless detail.empty?
          detail.unshift configuration[:message]
          record.errors.add(attr_name, detail.join(", "))
        end
      rescue ArgumentError, TypeError
        record.errors.add(attr_name, configuration[:message])
      end
    end
  end
  
  def self.proc_returns_true(configuration, record)
    configuration[:if] && configuration[:if].call(record)
  end
  
  def self.nil_not_allowed(configuration, record)
    !(configuration[:allow_nil] && record.send("#{attr_name}_before_type_cast").nil?)
  end
end