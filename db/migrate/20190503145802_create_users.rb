class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :last_name,        null: false
      t.string :first_name,       null: false
      t.string :last_name_roman,  null: true
      t.string :first_name_roman, null: true
      t.integer :sex,             null: false
      t.date :birthed_on,         null: false
      t.string :mail_address,     null: false
      t.string :password_digest,  null: false
      t.string :remember_token

      t.timestamps
    end
  end
end
