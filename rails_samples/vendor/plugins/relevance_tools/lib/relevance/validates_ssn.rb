class ActiveRecord::Base
  def self.validates_ssn(*attr_names)
    attr_names.each do |attr_name|
      validates_format_of attr_name,
        :with => /^[\d]{3}-[\d]{2}-[\d]{4}$/,
        :if => Proc.new { |u| !u.send(attr_name).blank? },
        :message => "must be of format ###-##-####"
    end
  end
end