class ProductSuggest < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category

  validates_processing_of :image
  validates :product_name, presence: true
end
