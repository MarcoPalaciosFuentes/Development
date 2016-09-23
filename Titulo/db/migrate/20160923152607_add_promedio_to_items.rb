class AddPromedioToItems < ActiveRecord::Migration
  def change
    add_column :items, :promedio, :float
  end
end
