class User < ApplicationRecord
    has_secure_password

    validates :email, uniqueness: { case_sensitive: false }
    validates :username, uniqueness: { case_sensitive: false }, presence: true

    def update_balance(expense)
        if expense.kind == 'deposit'
          self.balance = self.balance + expense.charge
          self.save
        elsif expense.kind == 'withdraw'
          if self.balance >= expense.charge
            self.balance = self.balance - expense.charge
            self.save
          else
            return 'Balance too.'
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
