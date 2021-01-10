class Expense < ApplicationRecord
  belongs_to :user
  validates :charge, presence: true
  validates_inclusion_of :kind, :in => ['deposit', 'withdraw']

end
