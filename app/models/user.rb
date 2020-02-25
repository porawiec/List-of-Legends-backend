class User < ApplicationRecord
    has_many :wishes
    has_many :user_champs
    has_many :skins, through: :wishes
    has_many :champs, through: :user_champs

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
