class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.string :image
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
