class AuthorSerializer < ActiveModel::Serializer
  attributes :name, :age
  belongs_to :country
end
