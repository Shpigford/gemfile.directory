class AddNotesToGemfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :gemfiles, :notes, :text
  end
end
