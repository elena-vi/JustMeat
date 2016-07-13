json.array!(@reviews) do |review|
  json.extract! review, :id, :description, :image, :phone_number, :address, :user_id, :restaurant_id
  json.url review_url(review, format: :json)
end
