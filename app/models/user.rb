class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_default_role
  mount_uploader :avatar, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :product_suggests
  has_many :comments
  has_many :orders
  validates :name, presence: true, length: {maximum: 50}
  enum role: [:user, :admin]

  def is_user? user
    self == user
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
