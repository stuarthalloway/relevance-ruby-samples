require 'erb'
class ActiveRecord::Base
  # do not mix strings and numerics
  # If you do you will need to find something smarter than ActiveRecord::ConnectionAdapters::Column#type_cast
  def self.validates_relationship(rel, options)
    # "<%= first %> <%= op %> <%= second %> should be <%= match %>"
    raise "Not a relationship: #{rel}" unless rel.match(/^(\w+)\s*(\W+)\s*(\w+)$/)
    first, op, second = $1, $2, $3
    configuration = { :message => "<%= rel %> should match <%= match.inspect %>", 
                      :on => :save}
    configuration.update(options)
    match = options[:match] || raise(":match is required")
    send(validation_method(configuration[:on])) do |record|
      unless match === record.send(first).send(op, record.send(second))
        message=ERB.new(configuration[:message]).result(binding)
        record.errors.add(first, message) 
        record.errors.add(second, message)
      end
    end
  end
end