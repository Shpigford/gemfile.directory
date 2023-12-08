class CreateFavorites < ActiveRecord::Migration[7.2]
  def change
    create_table :favorites, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :favoritable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
