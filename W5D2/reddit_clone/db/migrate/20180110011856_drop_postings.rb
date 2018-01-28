class DropPostings < ActiveRecord::Migration[5.1]
  def change
    drop_table :postings
  end
end
