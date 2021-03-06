class User < ApplicationRecord
    has_many :wishes
    has_many :user_champs
    has_many :skins, through: :wishes
    has_many :champs, through: :user_champs

    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
