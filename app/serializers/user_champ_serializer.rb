class UserChampSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :champ
end
