class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name,                   null: false
      t.string :commercial_distribution

      t.timestamps
    end
  end
end
