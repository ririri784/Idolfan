class Topic < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :likes, as: :likeable, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
end
