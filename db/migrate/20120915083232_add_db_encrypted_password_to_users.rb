class AddDbEncryptedPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :db_encrypted_password, :string
  end
end
