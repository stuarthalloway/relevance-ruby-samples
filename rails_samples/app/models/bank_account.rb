# codecite class
class BankAccount < ActiveRecord::Base
  
  def transfer(amount, account)
    BankAccount.transaction do 
      account.class.transaction do 
        self.balance = self.balance - amount
        account.balance = account.balance + amount
        account.save!
        self.save!
      end
    end
  end
  
end
# codecite class