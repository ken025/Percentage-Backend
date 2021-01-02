class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :profile_img, :income, :balance
end
