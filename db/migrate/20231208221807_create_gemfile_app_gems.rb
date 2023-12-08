class CreateGemfileAppGems < ActiveRecord::Migration[7.2]
  def change
    create_table :gemfile_app_gems, id: :uuid do |t|
      t.references :gemfile, null: false, foreign_key: true, type: :uuid
      t.references :app_gem, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
