class ChangeDataTypeForEncryptedPassword < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :encrypted_password, :string, :limit => 1024
      t.change :password_salt, :string, :limit => 1024
      t.change :db_encrypted_password, :string, :limit => 1024
    end
  end

  def down
    change_table :users do |t|
      t.change :encrypted_password, :string
      t.change :password_salt, :string
      t.change :db_encrypted_password, :string
    end
  end
end
