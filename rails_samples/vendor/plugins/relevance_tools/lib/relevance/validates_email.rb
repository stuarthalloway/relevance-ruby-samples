class ActiveRecord::Base
  def self.validates_email(*attr_names)
    attr_names.each do |attr_name|
      validates_format_of attr_name,
        :with => /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/i,
        :if => Proc.new { |u| !u.send(attr_name).blank? },
        :message => "is not a valid e-mail address"
    end
  end
end