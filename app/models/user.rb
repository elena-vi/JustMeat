class User < ActiveRecord::Base
  has_many :restaurants
  has_many :reviews
end
