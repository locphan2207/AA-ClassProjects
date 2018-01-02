class AddUsers < ActiveRecord::Migration[5.1]
  create_table :users do |t|
    t.string :username, null: false
    t.timestamps
  end
end
