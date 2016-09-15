class ProductSuggest < ActiveRecord::Base
  before_create :set_default_status

  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category

  validates_processing_of :image
  validates :product_name, presence: true
  enum status: [:pending, :accepted]

  private

    def set_default_status
      self.status ||= :pending
    end
end
