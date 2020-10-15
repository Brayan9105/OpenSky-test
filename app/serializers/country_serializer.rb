class CountrySerializer < ActiveModel::Serializer
  attributes :name
  has_many :authors
end
