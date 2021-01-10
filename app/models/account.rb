class Account < ApplicationRecord
  has_many :expenses
  validates :name, :balance, presence: true

  def update_balance(expense)
    if expense.kind == 'deposit'
      self.balance = self.balance + expense.charge
      self.save
    elsif expense.kind == 'withdraw'
      if self.balance >= expense.charge
        self.balance = self.balance - expense.charge
        self.save
      else
        return 'Balance too low.'
      end
    end
  end

  def update_balance_on_delete(expense)
    if expense.kind == 'deposit'
      if self.balance >= expense.charge
        self.balance = self.balance - expense.charge
        self.save
      else
        return 'Balance too low.'
      end
    elsif expense.kind == 'withdraw'
        self.balance = self.balance + expense.charge
        self.save
    end
  end
end