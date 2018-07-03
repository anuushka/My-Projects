class AddStatusToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :status, :integer,:default => "0"
  end
end
