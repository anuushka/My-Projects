class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name, null:false
      t.string :fb_id, null:true
      t.integer :user_type, null:false, default:0
      t.timestamps
    end
  end
end