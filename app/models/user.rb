class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
validates :name, presence: true 
validates :profile, length: { maximum: 200 }
mount_uploader :image, ImageUploader
has_many :instas, dependent: :destroy 
has_many :likes, dependent: :destroy
has_many :liked_instas, through: :likes, source: :insta

  def already_liked?(insta)
    self.likes.exists?(insta_id: insta.id)
  end
end
