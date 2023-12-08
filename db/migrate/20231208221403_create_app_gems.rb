class CreateAppGems < ActiveRecord::Migration[7.2]
  def change
    create_table :app_gems, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
