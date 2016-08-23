class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :region
      t.string :name_place
      t.string :description
      t.string :weather
      t.string :environment
      t.string :activities

      t.timestamps null: false
    end
  end
end
