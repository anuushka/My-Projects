class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :surName, null:false
      t.string :name, null:false
      t.string :PD, null:false
      t.string :email, null:false
      t.string :phone, null:false
      t.string :password_digest, null:false

      t.timestamps
    end
    add_index :admins, :email, unique: true
  end
end
