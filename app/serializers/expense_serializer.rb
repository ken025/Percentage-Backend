class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :kind, :account_id

  def date
    self.object.date.strftime("%m/%d/%Y %I:%M%p")
  end
end
