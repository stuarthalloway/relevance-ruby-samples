# codecite requires
require 'rubygems'
require 'activeresource'
# codecite requires

# codecite ActiveResource
class Quote < ActiveResource::Base
  self.site = "http://localhost:3001"
end
# codecite ActiveResource

# codecite get
Quote.find(:all).each do |quote|
  puts quote.body
  puts "*" * 72
end  
# codecite get

# codecite post
q = Quote.new(:body=>"If you can’t test it, then it’s not a beautiful design.",
              :source=>"David C")
q.save
puts "Saved with id #{q.id}"
# codecite post

# codecite put
q.source = "David Chelimsky"
q.save
# codecite put

# codecite destroy
q.destroy
# codecite destroy