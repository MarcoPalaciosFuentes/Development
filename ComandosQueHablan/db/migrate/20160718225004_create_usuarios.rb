class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.boolean :admin
      t.string :nombre_usuario
      t.string :password_digest
      t.string :primer_nombre
      t.string :apellido
      t.string :email

      t.timestamps null: false
    end
  end
end
