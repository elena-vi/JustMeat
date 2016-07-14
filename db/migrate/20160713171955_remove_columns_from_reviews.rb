class RemoveColumnsFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :image, :string
    remove_column :reviews, :phone_number, :string
    remove_column :reviews, :address, :string
  end
end
