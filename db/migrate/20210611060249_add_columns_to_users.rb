class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :string, null: false, default: ""
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :user_name, :string, null: false
    add_column :users, :profile_image, :string

    add_index :users, :user_name, unique: true
  end
end
