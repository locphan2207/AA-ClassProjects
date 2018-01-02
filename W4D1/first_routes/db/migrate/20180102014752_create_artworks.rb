class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.integer :owner_id, null: false
    end
  end
end
