class User < ActiveRecord::Base
  has_many :product_suggests
  has_many :comments
  has_many :orders
end
