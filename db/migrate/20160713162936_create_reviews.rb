class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.string :image
      t.string :phone_number
      t.string :address
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
