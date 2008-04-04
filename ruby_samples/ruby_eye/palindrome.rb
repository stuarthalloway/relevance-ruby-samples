# codecite raw
def palindrome?(str)
  str == str.reverse
end
# codecite raw

# codecite String
class String
  def palindrome?
    self == self.reverse
  end
end
# codecite String

# codecite include
module PuzzleExtensions
  def palindrome?
    self == self.reverse
  end
end
class String
  include PuzzleExtensions
end
# codecite include
