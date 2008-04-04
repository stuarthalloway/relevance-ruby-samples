class Member < ActiveRecord::Base
  # codecite mappings
  set_table_name "hrMEM002"
  set_primary_key "memID"
  # codecite mappings
  # codecite attributes
  alias_attribute :first_name, :memFN
  alias_attribute :last_name, :memLN
  alias_attribute :ssn, :memSSN
  # codecite attributes
  # codecite has many  
  has_many :policies, :foreign_key => 'polHOLDER'
  # codecite has many
end