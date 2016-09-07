class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :product_suggests
  has_many :comments
  has_many :orders
  validates :name, presence: true, length: {maximum: 50}
end
