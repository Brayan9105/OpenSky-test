class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  has_one :country
end
