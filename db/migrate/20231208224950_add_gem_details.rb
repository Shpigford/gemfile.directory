class AddGemDetails < ActiveRecord::Migration[7.2]
  def change
    add_column :app_gems, :details, :jsonb, default: {}
  end
end
