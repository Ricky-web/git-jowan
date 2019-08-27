class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  validates :nickname,
  presence: true, uniqueness: true, length: {maximum: 10}
  
  has_one_attached :image
  has_many :posts
  has_many :likes
  has_many :views
  
  def already_watched?(post)
    self.views.exists?(post_id: post.id)
  end
end
