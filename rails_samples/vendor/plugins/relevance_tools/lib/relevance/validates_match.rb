require 'erb'
class ActiveRecord::Base
  # Validates whether the value of the specified attribute is matched (by case equality)
  #
  #   class Class < ActiveRecord::Base
  #     validates_match :grade, :in=>('A'..'E')
  #   end
  #
  # Configuration options:
  # * <tt>in</tt> - Anything that implements ===
  # * <tt>message</tt> - Specifies a customer error message
  # * <tt>allow_nil</tt> - If set to true, skips this validation if the attribute is null (default is: false)
  # * <tt>if</tt> - Specifies a method, proc or string to call to determine if the validation should
  # occur (e.g. :if => :allow_validation, or :if => Proc.new { |user| user.signup_step > 2 }).  The
  # method, proc or string should return or evaluate to a true or false value.
  def self.validates_match(*attr_names)
    configuration = { :message => ActiveRecord::Errors.default_error_messages[:match], :on => :save }
    configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
    matcher = configuration[:in]
    message = configuration[:message] % matcher.to_s
    validates_each(attr_names, configuration) do |record, attr_name, value|
      record.errors.add(attr_name, message) unless matcher===value
    end
  end
end
ActiveRecord::Errors.default_error_messages[:match] = "does not match %s"