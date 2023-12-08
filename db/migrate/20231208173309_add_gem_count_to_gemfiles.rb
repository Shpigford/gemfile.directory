class AddGemCountToGemfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :gemfiles, :gem_count, :integer
  end
end
