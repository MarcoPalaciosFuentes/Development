class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :name
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :token_digest

      t.timestamps null: false
    end
    add_index :users, :email
  end
end
