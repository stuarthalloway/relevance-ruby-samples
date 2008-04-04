# Add ability to override Inflector#titleize (aka String#titleize via ActiveSupport) to return
# a specific string instead of just capitalizing the first letter of each word.  We only support
# one for one string replacements, we don't support regular expressions.
# 
# The syntax follows the same pattern as pluralization overrides:
# 
# Inflector.inflections do |inflect|
#   inflect.title 'ssn', 'SSN'
#   inflect.title 'employee of', 'Employee of'
#   inflect.title 'user id', 'User ID'
# end
#
Inflector::Inflections.class_eval do
    attr_reader :titles
    
    def title(rule, replacement)
      @titles[rule.downcase] = replacement
    end
end

Inflector.module_eval do
  def titleize_with_customizations(word)
    downcased_word = word.dup.downcase
    inflections.titles[downcased_word] || titleize_without_customizations(word)
  end
  alias_method_chain :titleize, :customizations
end

Inflector::Inflections.instance.instance_eval do
  @titles = {}
end

