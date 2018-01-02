class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :artworks, :owner_id, :artist_id
    add_column :artworks, :image_url, :string, null: false
    rename_column :artshares, :art_id, :artwork_id
    rename_column :artshares, :shared_user_id, :viewer_id
  end
end
