require 'java'

RealThread = java.lang.Thread
10.times do 
  (RealThread.new do
    puts "I am on thread #{RealThread}"
  end).start
end
  