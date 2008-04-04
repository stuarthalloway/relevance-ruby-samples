class String
  def methodize
    downcase.gsub(' ', '_')
  end
  
  def self.random(length = 10, alpha_only = false)
    # TODO: Add obscenity filter to this code.  I might suggest starting by removing the letters: 
    # X S F C T N G 
    # This eliminates whole swathes of nastiness without dramatically reducing the overall scope of the set.
    schars = "#{'0124356789' unless alpha_only}abcdefghijklmnopqrstuvwxyz"
    random = ""
    1.upto(length) { random += schars[rand(schars.length),1] }
    random.upcase
  end
end
