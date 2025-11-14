class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_topics, through: :likes, source: :topic
  has_many :comments, dependent: :destroy

  def already_liked?(likeable)
    likes.exists?(likeable: likeable)
  end
end
