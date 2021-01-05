class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :charge

  def date
    self.object.date.strftime("%b %d, %Y")
  end
end
