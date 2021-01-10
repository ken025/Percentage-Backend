class Expense < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true
  validates_inclusion_of :kind, :in => ['deposit', 'withdraw']

end
