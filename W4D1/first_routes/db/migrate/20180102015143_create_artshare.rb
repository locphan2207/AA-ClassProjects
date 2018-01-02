class CreateArtshare < ActiveRecord::Migration[5.1]
  def change
    create_table :artshares do |t|
      t.integer :art_id, null: false
      t.integer :shared_user_id, null: false
    end
  end
end
