class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :skins
  # :password_digest
end
