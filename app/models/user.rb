class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_default_role
  mount_uploader :avatar, ImageUploader
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  has_many :product_suggests
  has_many :comments
  has_many :orders
  validates :name, presence: true, length: {maximum: 50}
  enum role: [:user, :admin]
  ratyrate_rater

  def is_user? user
    self == user
  end

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0, 20]
        user.provider = auth.provider
        user.uid = auth.uid
      end
    end
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
