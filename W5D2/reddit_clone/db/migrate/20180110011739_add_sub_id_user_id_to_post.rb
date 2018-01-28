class AddSubIdUserIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :sub_id, :integer
  end
end
