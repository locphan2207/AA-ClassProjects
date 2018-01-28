class RemoveUserIdPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :sub
    remove_column :posts, :author
  end
end
