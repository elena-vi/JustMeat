class Restaurant < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'

  belongs_to :user
  has_many :reviews

  validates :user, presence: true

  mount_uploader :image, RestaurantPictureUploader

end
