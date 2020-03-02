class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :skins, :friends
end