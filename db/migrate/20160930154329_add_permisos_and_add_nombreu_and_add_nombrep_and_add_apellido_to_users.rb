class AddPermisosAndAddNombreuAndAddNombrepAndAddApellidoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :permisos, :boolean, :default => false, :null => false
    add_column :users, :nombreu, :string
    add_column :users, :nombrep, :string
    add_column :users, :apellido, :string
  end
end
