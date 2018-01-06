class AddBandIdToAlbum < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :band_id, :integer, null: false
  end
end
