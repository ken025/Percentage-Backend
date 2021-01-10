class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :charge, :kind, :account_id

  def date
    self.object.date.strftime("%b %d, %Y")
  end
end
