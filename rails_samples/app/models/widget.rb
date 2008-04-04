# This is pretty close to Rails' build in :db formats, but
# worth demoing the ability to register names strfime formats
Time::DATE_FORMATS[:custom_json] = "%Y-%m-%d %H:%M:%S %Z"

class Widget < ActiveRecord::Base
  validates_presence_of :name, :color
  
  # When the format varies from Rails' built-in to_json,
  # you have two choices: customize Rails serialization or 
  # just build the arrays and hashes yourself. The latter 
  # approach is easier in this case (and in general!) and
  # is shown below.
  def self.to_custom_json(widgets)
    widget_hashes = widgets.map {|widget|
      {
        :type => "widget",
        :label => widget.name,
        :updated_at => widget.updated_at.to_s(:custom_json),
        :id => widget.id,
        :color => widget.color,
        :created_at => widget.created_at.to_s(:custom_json)
      }
    }
    [:items => widget_hashes].to_json
  end
  
  
end
