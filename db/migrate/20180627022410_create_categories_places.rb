class CreateCategoriesPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_places do |t|
      t.references :place, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
