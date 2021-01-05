class Expense < ApplicationRecord
  belongs_to :user
  validates :name, :charge, presence: true
end
