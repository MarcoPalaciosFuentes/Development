class AddLatitudAndLongitudToItems < ActiveRecord::Migration
  def change
    add_column :items, :latitud, :string
    add_column :items, :longitud, :string
  end
end
