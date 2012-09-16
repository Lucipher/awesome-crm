class AddDbEncryptedPasswordToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :db_encrypted_password, :string, :limit => 1024
  end
end
