class Policy < ActiveRecord::Base
  # codecite mappings
  set_table_name "hrPOL001"
  set_primary_key "polID"
  # codecite mappings
  # codecite attributes
  alias_attribute :policy_type, :polTYPE
  alias_attribute :policy_number, :polNUMBER
  # codecite attributes
  # codecite belongs to  
  belongs_to :policy_holder, :class_name => 'Member', :foreign_key => 'polHOLDER'
  # codecite belongs to  
end