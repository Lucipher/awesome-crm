class RemoveEncryptedCskFromSession < ActiveRecord::Migration
  def up
    remove_column :sessions, :encrypted_csk
  end

  def down
    add_column :sessions, :encrypted_csk, :string
  end
end
