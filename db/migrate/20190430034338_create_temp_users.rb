class CreateTempUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :temp_users do |t|
      t.string :mail_address,            null: false
      t.string :last_name,               null: false
      t.string :first_name,              null: false
      t.string :token,        limit: 64, null: false
      t.datetime :expired_at,            null: false

      t.timestamps
    end
    add_index :temp_users, :mail_address, unique: true
    add_index :temp_users, :token,        unique: true
  end
end
