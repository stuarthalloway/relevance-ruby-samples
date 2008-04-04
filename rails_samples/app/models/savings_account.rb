# codecite class
class SavingsAccount < BankAccount
  def calculate_interest
    self.balance * (self.rate / 100)
  end
end
# codecite class