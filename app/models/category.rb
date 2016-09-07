class Category < ActiveRecord::Base
  has_many :product_suggests
  has_many :products

  validates :name,  presence: true
end
