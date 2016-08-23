class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :Place
      t.text :description
      t.string :region
      t.string :weather
      t.string :environment
      t.string :activities

      t.timestamps null: false
    end
  end
end
