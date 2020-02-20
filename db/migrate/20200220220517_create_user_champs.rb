class CreateUserChamps < ActiveRecord::Migration[6.0]
  def change
    create_table :user_champs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :champ, null: false, foreign_key: true

      t.timestamps
    end
  end
end
