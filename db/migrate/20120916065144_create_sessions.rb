class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :cookie_id
      t.string :encrypted_csk

      t.timestamps
    end
  end
end
