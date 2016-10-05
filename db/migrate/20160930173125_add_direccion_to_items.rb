class AddDireccionToItems < ActiveRecord::Migration
  def change
    add_column :items, :direccion, :string
  end
end
