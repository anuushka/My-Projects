class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :title
      t.string :image
      t.text :description
      t.string :timetable
      t.time :opentime
      t.time :closetime
      t.decimal :price
      t.string :location
      t.float :longitude
      t.float :latitude
      t.string :phone
      t.integer :count

      t.timestamps
    end
  end
end
