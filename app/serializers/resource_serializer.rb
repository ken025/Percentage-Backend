class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :source, :link
end
