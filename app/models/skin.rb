class Skin < ApplicationRecord
  has_many :wishes
  has_many :users, through: :wishes
  belongs_to :champ
end
