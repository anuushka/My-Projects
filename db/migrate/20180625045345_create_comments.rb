class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :user
      t.text :post
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
