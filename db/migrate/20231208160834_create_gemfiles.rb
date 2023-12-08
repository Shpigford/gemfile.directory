class CreateGemfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :gemfiles, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.text :content

      t.timestamps
    end
  end
end
