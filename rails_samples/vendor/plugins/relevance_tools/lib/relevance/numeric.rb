class Numeric
  def scale
    decimals = self.to_s.match /\.(\d*)$/
    decimals ? decimals[1].size : 0
  end
end

