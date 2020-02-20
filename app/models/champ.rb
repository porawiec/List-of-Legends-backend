class Champ < ApplicationRecord
    has_many :user_champs
    has_many :skins
end
