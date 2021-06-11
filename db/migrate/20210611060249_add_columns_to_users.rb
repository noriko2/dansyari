class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :user_name, :string
    add_column :users, :profile_image, :string
  end
end
