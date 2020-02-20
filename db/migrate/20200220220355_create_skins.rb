class CreateSkins < ActiveRecord::Migration[6.0]
  def change
    create_table :skins do |t|
      t.string :name
      t.string :splash_img
      t.string :loading_img
      t.references :champ, null: false, foreign_key: true

      t.timestamps
    end
  end
end
