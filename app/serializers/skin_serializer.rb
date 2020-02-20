class SkinSerializer < ActiveModel::Serializer
  attributes :id, :name, :splash_img, :loading_img
  has_one :champ
end
