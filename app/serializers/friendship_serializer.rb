class FriendshipSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :friend
end
