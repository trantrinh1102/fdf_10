class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :comments
  has_many :order_items
  belongs_to :category

  validates_processing_of :image
  validate :image_size_validation
  validates :name, :price, :category_id, presence: true

  private

  def image_size_validation
    if image.size > Settings.megabytes_image.megabytes
      errors[:image] << I18n.t("image_size")
    end
  end
end
