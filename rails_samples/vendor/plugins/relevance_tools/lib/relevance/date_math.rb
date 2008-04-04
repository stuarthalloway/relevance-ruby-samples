module Relevance; end
module Relevance::DateMath
  # The Rails helpers such as 10.years are only approximate, because
  # you cannot tell how long 10 years is unless you know which year
  # you start from.
  # This method is exact (assuming no bugs in underlying date)
  # When you find an existing library method that does this send
  # a mocking email to stu@relevancellc.com
  def add(amount, units)
    case units
    when :years
      Date.civil(year+amount,month,day)
    when :days
      self+amount
    else
      raise ArgumentError, "Illegal units #{units}"
    end
  end
end

Date.class_eval {include Relevance::DateMath}