words = 0
while (gets)
  words += scan(/\w+/).size
end
puts "Word count: #{words}"   