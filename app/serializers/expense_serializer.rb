class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :charge
  has_one :user
end
