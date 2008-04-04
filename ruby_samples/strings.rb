# codecite sentence
s = "the QUICK BROWN fox jumped over the LAZY dog"

# codecite upcase
puts s.upcase

# codecite downcase
puts s.downcase

# codecite capitalize
puts s.capitalize

# codecite word_capitalize
class String
  def word_capitalize
    self.split(/\s/).map {|s| s.capitalize}.join(' ')
  end
end
puts s.word_capitalize
# codecite word_capitalize

# codecite length
puts "Length of sentence: #{s.length}"

# codecite word length
puts "Length of words: #{s.split(/\s/).map {|w| w.size}.inspect}"

# codecite longest word
puts "Longest word: #{s.split(/\s/).map {|w| w.size}.max}"

# codecite leaped
puts s.sub('jumped', 'leaped')
puts s.sub('the', 'a')

# codecite a
puts s.gsub('the', 'a')

# codecite period
puts s << "."
