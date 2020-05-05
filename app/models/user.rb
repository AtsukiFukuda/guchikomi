class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
  mount_uploader :image, ImageUploader  

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  has_many :cheers, dependent: :destroy
  has_many :cheered_posts, through: :cheers, source: :post
  def already_cheered?(post)
    self.cheers.exists?(post_id: post.id)
  end

  has_many :forgets, dependent: :destroy
  has_many :forgot_posts, through: :forgets, source: :post
  def already_forgot?(post)
    self.forgets.exists?(post_id: post.id)
  end
end
