class UserChamp < ApplicationRecord
  belongs_to :user
  belongs_to :champ
end
