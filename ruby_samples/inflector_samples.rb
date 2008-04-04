require 'rubygems'
require_gem 'rails'
# codecite some_ruby_filename
puts 'some_ruby_filename'.camelize
# codecite some_ruby_method
puts 'some_ruby_method'.camelize(false)
# codecite classify
puts 'ObjectSpaces'.classify
# codecite constantize
puts 'TRUE'.constantize
# codecite dasherize
puts "ruby_name".dasherize
# codecite demodulize
puts 'Test::Unit::TestCase'.demodulize
# codecite foreign_key
puts 'LineItem'.foreign_key
# codecite humanize
puts 'some_ruby_name'.humanize
# codecite ordinalize
puts [1,2,3,4,5].map(&:ordinalize)
# codecite pluralize thing
puts 'thing'.pluralize
# codecite pluralize woman
puts 'woman'.pluralize
# codecite tableize
puts 'LineItem'.tableize
# codecite underscore
puts 'LineItem'.underscore

# codecite bad plurals
puts 'radius'.pluralize
puts 'luggage'.pluralize
# codecite bad plurals

# codecite inflections
Inflector.inflections do |i|
  i.irregular 'radius', 'radii'
  i.uncountable 'luggage'
end
# codecite inflections

# codecite good plurals
puts 'radius'.pluralize
puts 'luggage'.pluralize
# codecite good plurals

