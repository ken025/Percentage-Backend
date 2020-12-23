class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :bill_name, :price, :monthly
end
