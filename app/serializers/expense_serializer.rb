class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :bill_name, :price
  has_one :monthly
end
