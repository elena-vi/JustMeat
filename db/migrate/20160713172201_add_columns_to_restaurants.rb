class AddColumnsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :image, :string
    add_column :restaurants, :phone_number, :string
    add_column :restaurants, :address, :string
  end
end
