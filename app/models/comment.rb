class Comment < ApplicationRecord
  has_many :likes, as: :likeable, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  has_one_attached :image
end
