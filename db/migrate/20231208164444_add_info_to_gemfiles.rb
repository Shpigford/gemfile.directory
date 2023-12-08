class AddInfoToGemfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :gemfiles, :name, :string
    add_column :gemfiles, :app_link, :string
    add_column :gemfiles, :github_link, :string
  end
end
