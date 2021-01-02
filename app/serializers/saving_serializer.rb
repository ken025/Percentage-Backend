class SavingSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_price, :total_saved
  has_one :user
end
