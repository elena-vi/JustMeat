class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates_associated :user
end
