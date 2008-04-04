require 'relevance/active_record'

module Relevance::ActiveRecord::InstanceMethods
  # Returns the created or updated object, already saved if valid.
  # Typically controllers will then branch on valid?
  def create_or_update_association(association, atts)
    assoc = send(association)
    if assoc
      # update_attributes violates principle of least surprise by blowing away attributes
      # not explicitly passed in, so we merge the existing attributes manually
      attributes = assoc.attributes.merge(atts)
      assoc.update_attributes(attributes)
    else
      send("create_#{association}", atts)
    end
    send(association)  
  end
end