class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false 
      t.integer :yr, null: false
      t.boolean :live, default: false 
      t.timestamps
    end
  end
end
