class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :image

      t.timestamps
    end
  end
end
