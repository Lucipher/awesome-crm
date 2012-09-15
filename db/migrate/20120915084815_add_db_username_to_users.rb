class AddDbUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :db_username, :string
  end
end
