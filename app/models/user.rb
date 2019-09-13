class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  validates :nickname,
  presence: true, uniqueness: true, length: {maximum: 10}
  
  has_one_attached :image
  has_many :posts, foreign_key: :user_id, dependent: :destroy
  has_many :likes, foreign_key: :user_id, dependent: :destroy
  has_many :views, foreign_key: :user_id, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  
  def already_watched?(post)
    self.views.exists?(post_id: post.id)
  end
  
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
